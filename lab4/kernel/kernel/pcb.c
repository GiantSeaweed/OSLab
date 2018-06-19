#include "x86.h"
#include "device.h"

extern SegDesc gdt[NR_SEGMENTS];
extern TSS tss;

void idle(){
    putChar('i');
    putChar('d');
    putChar('l');
    putChar('e');
    putChar(' ');

    asm volatile("movl %0, %%esp;" ::"i"(0x200000));
    asm volatile("sti");
    waitForInterrupt();
}

struct ProcessTable* findRunable(){
    struct ProcessTable* p = pcb_header;
    while (p != NULL){
        if (p->state == RUNABLE){
            return p;
        }
        p = p->next;
    }
    return NULL;
}

void moveCurProToTail()
{
    struct ProcessTable *p;
    // move current process to the end of the list
    if (pcb_current != NULL)
    {
        p = pcb_current->next;
        if (p != NULL)
        {
            pcb_header = pcb_current->next;
            pcb_current->next = NULL;
            while (p->next != NULL)
            {
                p = p->next;
            }
            p->next = pcb_current;
            pcb_current = NULL;
        }
    }
}
void schedule(){
    // move current process to the end of the list
    moveCurProToTail();

    // find a runable process and  change its state
    pcb_current = findRunable();
    if(pcb_current != NULL){
        pcb_current->state = RUNNING;
    }

    // load next process
    if (pcb_current == NULL){ 
        idle();
    }
    else{
        //  tss
        tss.esp0 = (uint32_t) & (pcb_current->stack[MAX_STACK_SIZE]);
        //tss.ss0 = KSEL(SEG_KDATA);

        gdt[SEG_UCODE] = SEG(STA_X | STA_R, (pcb_current-pcb) * USER_MEMSIZE, 0xffffffff, DPL_USER);
        gdt[SEG_UDATA] = SEG(STA_W,         (pcb_current-pcb) * USER_MEMSIZE, 0xffffffff, DPL_USER);
       
        // Restore process information！By reading pcb->tf first!
        asm volatile("movl %0, %%esp" ::"r"(&pcb_current->tf));//change STACK
        asm volatile("popl %gs");
        asm volatile("popl %fs");
        asm volatile("popl %es");
        asm volatile("popl %ds");
        asm volatile("popal"); 
        asm volatile("addl $4, %esp"); //interrupt vector
        asm volatile("addl $4, %esp");  //error code
        asm volatile("iret");
        
    }
}

void initPCB(){
    for(int i = 0; i < MAX_PCB_NUM-1; i++){
        pcb[i].next = &pcb[i+1];
    }
    pcb[MAX_PCB_NUM-1].next = NULL;

    pcb_header = NULL;
    pcb_available = &pcb[0];
    pcb_current = NULL;
}

struct ProcessTable* newPCB(){
    if(pcb_available == NULL){
        assert(0);      //no more space for process    
    }
    struct ProcessTable* p = pcb_available;
    pcb_available = pcb_available->next;
    p->next = NULL;
    p->timeCount = TIMESLICE;
    p->sleepTime = 0;
    p->pid = PID_START + (p - pcb); 
    p->state = RUNABLE;
    
    // *** add to the end of list ***
    struct ProcessTable* head = pcb_header;
    if(head == NULL){
        pcb_header = p;
    }
    else{
        while (head->next != NULL){
            head = head->next;
        }
        head->next = p;
    }
  
    return p;
}

void enterMainprocess(uint32_t entry)
{
    //video_print(0,0,'K');
    pcb_current = newPCB();

    //set segment register
    asm volatile("movl %0, %%eax" ::"r"(USEL(SEG_UDATA)));
    asm volatile("movw %ax, %ds");
    asm volatile("movw %ax, %es");
    asm volatile("movw %ax, %fs");

    // set the PCB of main process
    pcb_current->tf.esp = USER_BASE + USER_MEMSIZE;
    pcb_current->tf.ss  = USEL(SEG_UDATA);
    pcb_current->tf.cs  = USEL(SEG_UCODE);
    pcb_current->tf.eip = entry;

    pcb_current->state = RUNNING;
    pcb_current->timeCount = TIMESLICE;
    pcb_current->sleepTime = 0;
    pcb_current->pid = USER_BASE;

    asm volatile("push %0" ::"i"(USEL(SEG_UDATA)));     //%ss
    asm volatile("push %0" ::"i"(USER_BASE + USER_MEMSIZE)); //%esp 
    asm volatile("pushfl");                             //push eflags
    asm volatile("push %0" ::"i"(USEL(SEG_UCODE)));     //%cs
    asm volatile("push %0" ::"r"(entry));               //%eip
    // return to user space
    asm volatile("iret");
}
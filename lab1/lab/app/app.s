.code32

.global start
start:
	movl $((80*5+0)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $72, %al                           #72为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x
	
	movl $((80*5+1)*2), %edi                #在第5行第1列打印
	movb $0x0c, %ah                         #黑底红字
	movb $101, %al                          #101为e的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+2)*2), %edi                #在第5行第2列打印
	movb $0x0c, %ah                         #黑底红字
	movb $108, %al                          #108为l的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+3)*2), %edi                #在第5行第3列打印
	movb $0x0c, %ah                         #黑底红字
	movb $108, %al                          #108为l的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+4)*2), %edi                #在第5行第4列打印
	movb $0x0c, %ah                         #黑底红字
	movb $111, %al                          #111为o的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+5)*2), %edi                #在第5行第5列打印
	movb $0x0c, %ah                         #黑底红字
	movb $44, %al                           #44为,的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+6)*2), %edi                #在第5行第6列打印
	movb $0x0c, %ah                         #黑底红字
	movb $32, %al                           #32为 的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+7)*2), %edi                #在第5行第7列打印
	movb $0x0c, %ah                         #黑底红字
	movb $87, %al                           #87为W的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+8)*2), %edi                #在第5行第8列打印
	movb $0x0c, %ah                         #黑底红字
	movb $111, %al                          #111为o的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+9)*2), %edi                #在第5行第9列打印
	movb $0x0c, %ah                         #黑底红字
	movb $114, %al                          #114为r的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+10)*2), %edi               #在第5行第10列打印
	movb $0x0c, %ah                         #黑底红字
	movb $108, %al                          #108为l的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+11)*2), %edi               #在第5行第11列打印
	movb $0x0c, %ah                         #黑底红字
	movb $100, %al                          #100为d的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x

	movl $((80*5+12)*2), %edi               #在第5行第12列打印
	movb $0x0c, %ah                         #黑底红字
	movb $33, %al                           #33为!的ASCII码
	movw %ax, %gs:(%edi)                    #写显存x
	
	jmp start
	


uMain.elf:     file format elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	57                   	push   %edi
  200004:	56                   	push   %esi
  200005:	53                   	push   %ebx
  200006:	83 ec 0c             	sub    $0xc,%esp
  200009:	e8 c1 00 00 00       	call   2000cf <__x86.get_pc_thunk.bx>
  20000e:	81 c3 f2 1f 00 00    	add    $0x1ff2,%ebx
  200014:	e8 db 00 00 00       	call   2000f4 <fork>
  200019:	89 c6                	mov    %eax,%esi
  20001b:	83 ec 0c             	sub    $0xc,%esp
  20001e:	8d 83 00 e5 ff ff    	lea    -0x1b00(%ebx),%eax
  200024:	50                   	push   %eax
  200025:	e8 9a 03 00 00       	call   2003c4 <printf>
  20002a:	5f                   	pop    %edi
  20002b:	58                   	pop    %eax
  20002c:	56                   	push   %esi
  20002d:	8d 83 17 e5 ff ff    	lea    -0x1ae9(%ebx),%eax
  200033:	50                   	push   %eax
  200034:	e8 8b 03 00 00       	call   2003c4 <printf>
  200039:	83 c4 10             	add    $0x10,%esp
  20003c:	85 f6                	test   %esi,%esi
  20003e:	75 44                	jne    200084 <uEntry+0x84>
  200040:	c7 83 0c 00 00 00 02 	movl   $0x2,0xc(%ebx)
  200047:	00 00 00 
  20004a:	b8 02 00 00 00       	mov    $0x2,%eax
  20004f:	be 08 00 00 00       	mov    $0x8,%esi
  200054:	8d bb 21 e5 ff ff    	lea    -0x1adf(%ebx),%edi
  20005a:	66 90                	xchg   %ax,%ax
  20005c:	4e                   	dec    %esi
  20005d:	51                   	push   %ecx
  20005e:	56                   	push   %esi
  20005f:	50                   	push   %eax
  200060:	57                   	push   %edi
  200061:	e8 5e 03 00 00       	call   2003c4 <printf>
  200066:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  20006d:	e8 a2 00 00 00       	call   200114 <sleep>
  200072:	83 c4 10             	add    $0x10,%esp
  200075:	85 f6                	test   %esi,%esi
  200077:	74 4f                	je     2000c8 <uEntry+0xc8>
  200079:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
  20007f:	eb db                	jmp    20005c <uEntry+0x5c>
  200081:	8d 76 00             	lea    0x0(%esi),%esi
  200084:	46                   	inc    %esi
  200085:	74 46                	je     2000cd <uEntry+0xcd>
  200087:	c7 83 0c 00 00 00 01 	movl   $0x1,0xc(%ebx)
  20008e:	00 00 00 
  200091:	b8 01 00 00 00       	mov    $0x1,%eax
  200096:	be 08 00 00 00       	mov    $0x8,%esi
  20009b:	8d bb 3e e5 ff ff    	lea    -0x1ac2(%ebx),%edi
  2000a1:	eb 07                	jmp    2000aa <uEntry+0xaa>
  2000a3:	90                   	nop
  2000a4:	8b 83 0c 00 00 00    	mov    0xc(%ebx),%eax
  2000aa:	4e                   	dec    %esi
  2000ab:	52                   	push   %edx
  2000ac:	56                   	push   %esi
  2000ad:	50                   	push   %eax
  2000ae:	57                   	push   %edi
  2000af:	e8 10 03 00 00       	call   2003c4 <printf>
  2000b4:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  2000bb:	e8 54 00 00 00       	call   200114 <sleep>
  2000c0:	83 c4 10             	add    $0x10,%esp
  2000c3:	85 f6                	test   %esi,%esi
  2000c5:	75 dd                	jne    2000a4 <uEntry+0xa4>
  2000c7:	90                   	nop
  2000c8:	e8 67 00 00 00       	call   200134 <exit>
  2000cd:	eb fe                	jmp    2000cd <uEntry+0xcd>

002000cf <__x86.get_pc_thunk.bx>:
  2000cf:	8b 1c 24             	mov    (%esp),%ebx
  2000d2:	c3                   	ret    
  2000d3:	90                   	nop

002000d4 <syscall>:
  2000d4:	55                   	push   %ebp
  2000d5:	89 e5                	mov    %esp,%ebp
  2000d7:	57                   	push   %edi
  2000d8:	56                   	push   %esi
  2000d9:	53                   	push   %ebx
  2000da:	8b 55 14             	mov    0x14(%ebp),%edx
  2000dd:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2000e0:	8b 45 08             	mov    0x8(%ebp),%eax
  2000e3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2000e6:	8b 75 18             	mov    0x18(%ebp),%esi
  2000e9:	8b 7d 1c             	mov    0x1c(%ebp),%edi
  2000ec:	cd 80                	int    $0x80
  2000ee:	5b                   	pop    %ebx
  2000ef:	5e                   	pop    %esi
  2000f0:	5f                   	pop    %edi
  2000f1:	5d                   	pop    %ebp
  2000f2:	c3                   	ret    
  2000f3:	90                   	nop

002000f4 <fork>:
  2000f4:	55                   	push   %ebp
  2000f5:	89 e5                	mov    %esp,%ebp
  2000f7:	57                   	push   %edi
  2000f8:	56                   	push   %esi
  2000f9:	53                   	push   %ebx
  2000fa:	ba 01 00 00 00       	mov    $0x1,%edx
  2000ff:	31 f6                	xor    %esi,%esi
  200101:	b8 02 00 00 00       	mov    $0x2,%eax
  200106:	89 d3                	mov    %edx,%ebx
  200108:	89 d1                	mov    %edx,%ecx
  20010a:	89 f7                	mov    %esi,%edi
  20010c:	cd 80                	int    $0x80
  20010e:	5b                   	pop    %ebx
  20010f:	5e                   	pop    %esi
  200110:	5f                   	pop    %edi
  200111:	5d                   	pop    %ebp
  200112:	c3                   	ret    
  200113:	90                   	nop

00200114 <sleep>:
  200114:	55                   	push   %ebp
  200115:	89 e5                	mov    %esp,%ebp
  200117:	57                   	push   %edi
  200118:	56                   	push   %esi
  200119:	53                   	push   %ebx
  20011a:	ba 01 00 00 00       	mov    $0x1,%edx
  20011f:	31 f6                	xor    %esi,%esi
  200121:	b8 a2 00 00 00       	mov    $0xa2,%eax
  200126:	89 d3                	mov    %edx,%ebx
  200128:	89 d1                	mov    %edx,%ecx
  20012a:	89 f7                	mov    %esi,%edi
  20012c:	cd 80                	int    $0x80
  20012e:	5b                   	pop    %ebx
  20012f:	5e                   	pop    %esi
  200130:	5f                   	pop    %edi
  200131:	5d                   	pop    %ebp
  200132:	c3                   	ret    
  200133:	90                   	nop

00200134 <exit>:
  200134:	55                   	push   %ebp
  200135:	89 e5                	mov    %esp,%ebp
  200137:	57                   	push   %edi
  200138:	56                   	push   %esi
  200139:	53                   	push   %ebx
  20013a:	b8 01 00 00 00       	mov    $0x1,%eax
  20013f:	31 f6                	xor    %esi,%esi
  200141:	89 c3                	mov    %eax,%ebx
  200143:	89 c1                	mov    %eax,%ecx
  200145:	89 c2                	mov    %eax,%edx
  200147:	89 f7                	mov    %esi,%edi
  200149:	cd 80                	int    $0x80
  20014b:	5b                   	pop    %ebx
  20014c:	5e                   	pop    %esi
  20014d:	5f                   	pop    %edi
  20014e:	5d                   	pop    %ebp
  20014f:	c3                   	ret    

00200150 <printc>:
  200150:	55                   	push   %ebp
  200151:	89 e5                	mov    %esp,%ebp
  200153:	57                   	push   %edi
  200154:	56                   	push   %esi
  200155:	53                   	push   %ebx
  200156:	50                   	push   %eax
  200157:	ba 01 00 00 00       	mov    $0x1,%edx
  20015c:	8d 4d f0             	lea    -0x10(%ebp),%ecx
  20015f:	31 f6                	xor    %esi,%esi
  200161:	b8 04 00 00 00       	mov    $0x4,%eax
  200166:	89 d3                	mov    %edx,%ebx
  200168:	89 f7                	mov    %esi,%edi
  20016a:	cd 80                	int    $0x80
  20016c:	5a                   	pop    %edx
  20016d:	5b                   	pop    %ebx
  20016e:	5e                   	pop    %esi
  20016f:	5f                   	pop    %edi
  200170:	5d                   	pop    %ebp
  200171:	c3                   	ret    
  200172:	66 90                	xchg   %ax,%ax

00200174 <prints>:
  200174:	55                   	push   %ebp
  200175:	89 e5                	mov    %esp,%ebp
  200177:	57                   	push   %edi
  200178:	56                   	push   %esi
  200179:	53                   	push   %ebx
  20017a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  20017d:	80 39 00             	cmpb   $0x0,(%ecx)
  200180:	74 20                	je     2001a2 <prints+0x2e>
  200182:	31 c0                	xor    %eax,%eax
  200184:	40                   	inc    %eax
  200185:	89 c2                	mov    %eax,%edx
  200187:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  20018b:	75 f7                	jne    200184 <prints+0x10>
  20018d:	31 f6                	xor    %esi,%esi
  20018f:	bb 01 00 00 00       	mov    $0x1,%ebx
  200194:	b8 04 00 00 00       	mov    $0x4,%eax
  200199:	89 f7                	mov    %esi,%edi
  20019b:	cd 80                	int    $0x80
  20019d:	5b                   	pop    %ebx
  20019e:	5e                   	pop    %esi
  20019f:	5f                   	pop    %edi
  2001a0:	5d                   	pop    %ebp
  2001a1:	c3                   	ret    
  2001a2:	31 d2                	xor    %edx,%edx
  2001a4:	eb e7                	jmp    20018d <prints+0x19>
  2001a6:	66 90                	xchg   %ax,%ax

002001a8 <printd>:
  2001a8:	55                   	push   %ebp
  2001a9:	89 e5                	mov    %esp,%ebp
  2001ab:	57                   	push   %edi
  2001ac:	56                   	push   %esi
  2001ad:	53                   	push   %ebx
  2001ae:	83 ec 78             	sub    $0x78,%esp
  2001b1:	e8 46 03 00 00       	call   2004fc <__x86.get_pc_thunk.cx>
  2001b6:	81 c1 4a 1e 00 00    	add    $0x1e4a,%ecx
  2001bc:	8b 55 08             	mov    0x8(%ebp),%edx
  2001bf:	85 d2                	test   %edx,%edx
  2001c1:	75 21                	jne    2001e4 <printd+0x3c>
  2001c3:	ba 01 00 00 00       	mov    $0x1,%edx
  2001c8:	8d 89 5c e5 ff ff    	lea    -0x1aa4(%ecx),%ecx
  2001ce:	b8 04 00 00 00       	mov    $0x4,%eax
  2001d3:	89 d3                	mov    %edx,%ebx
  2001d5:	8b 75 08             	mov    0x8(%ebp),%esi
  2001d8:	89 f7                	mov    %esi,%edi
  2001da:	cd 80                	int    $0x80
  2001dc:	83 c4 78             	add    $0x78,%esp
  2001df:	5b                   	pop    %ebx
  2001e0:	5e                   	pop    %esi
  2001e1:	5f                   	pop    %edi
  2001e2:	5d                   	pop    %ebp
  2001e3:	c3                   	ret    
  2001e4:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  2001eb:	0f 84 c6 00 00 00    	je     2002b7 <printd+0x10f>
  2001f1:	8b 45 08             	mov    0x8(%ebp),%eax
  2001f4:	85 c0                	test   %eax,%eax
  2001f6:	0f 88 e9 00 00 00    	js     2002e5 <printd+0x13d>
  2001fc:	31 db                	xor    %ebx,%ebx
  2001fe:	8d 45 90             	lea    -0x70(%ebp),%eax
  200201:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
  200207:	8d 7d 8f             	lea    -0x71(%ebp),%edi
  20020a:	89 7d 80             	mov    %edi,-0x80(%ebp)
  20020d:	8b 7d 08             	mov    0x8(%ebp),%edi
  200210:	eb 04                	jmp    200216 <printd+0x6e>
  200212:	66 90                	xchg   %ax,%ax
  200214:	89 f3                	mov    %esi,%ebx
  200216:	8d 73 01             	lea    0x1(%ebx),%esi
  200219:	89 f8                	mov    %edi,%eax
  20021b:	b9 0a 00 00 00       	mov    $0xa,%ecx
  200220:	99                   	cltd   
  200221:	f7 f9                	idiv   %ecx
  200223:	8d 4a 30             	lea    0x30(%edx),%ecx
  200226:	8b 45 80             	mov    -0x80(%ebp),%eax
  200229:	88 0c 30             	mov    %cl,(%eax,%esi,1)
  20022c:	b8 67 66 66 66       	mov    $0x66666667,%eax
  200231:	f7 ef                	imul   %edi
  200233:	89 d0                	mov    %edx,%eax
  200235:	c1 f8 02             	sar    $0x2,%eax
  200238:	c1 ff 1f             	sar    $0x1f,%edi
  20023b:	29 f8                	sub    %edi,%eax
  20023d:	89 c7                	mov    %eax,%edi
  20023f:	75 d3                	jne    200214 <printd+0x6c>
  200241:	89 45 08             	mov    %eax,0x8(%ebp)
  200244:	85 db                	test   %ebx,%ebx
  200246:	74 33                	je     20027b <printd+0xd3>
  200248:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
  20024e:	8d 14 18             	lea    (%eax,%ebx,1),%edx
  200251:	31 c0                	xor    %eax,%eax
  200253:	89 75 80             	mov    %esi,-0x80(%ebp)
  200256:	89 df                	mov    %ebx,%edi
  200258:	88 cb                	mov    %cl,%bl
  20025a:	8b b5 7c ff ff ff    	mov    -0x84(%ebp),%esi
  200260:	eb 04                	jmp    200266 <printd+0xbe>
  200262:	66 90                	xchg   %ax,%ax
  200264:	8a 1a                	mov    (%edx),%bl
  200266:	8a 0c 06             	mov    (%esi,%eax,1),%cl
  200269:	88 1c 06             	mov    %bl,(%esi,%eax,1)
  20026c:	88 0a                	mov    %cl,(%edx)
  20026e:	40                   	inc    %eax
  20026f:	4a                   	dec    %edx
  200270:	89 f9                	mov    %edi,%ecx
  200272:	29 c1                	sub    %eax,%ecx
  200274:	39 c1                	cmp    %eax,%ecx
  200276:	7f ec                	jg     200264 <printd+0xbc>
  200278:	8b 75 80             	mov    -0x80(%ebp),%esi
  20027b:	c6 44 35 90 00       	movb   $0x0,-0x70(%ebp,%esi,1)
  200280:	80 7d 90 00          	cmpb   $0x0,-0x70(%ebp)
  200284:	74 7f                	je     200305 <printd+0x15d>
  200286:	8b 45 08             	mov    0x8(%ebp),%eax
  200289:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
  20028f:	90                   	nop
  200290:	40                   	inc    %eax
  200291:	89 c2                	mov    %eax,%edx
  200293:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200297:	75 f7                	jne    200290 <printd+0xe8>
  200299:	31 f6                	xor    %esi,%esi
  20029b:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002a0:	b8 04 00 00 00       	mov    $0x4,%eax
  2002a5:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
  2002ab:	89 f7                	mov    %esi,%edi
  2002ad:	cd 80                	int    $0x80
  2002af:	83 c4 78             	add    $0x78,%esp
  2002b2:	5b                   	pop    %ebx
  2002b3:	5e                   	pop    %esi
  2002b4:	5f                   	pop    %edi
  2002b5:	5d                   	pop    %ebp
  2002b6:	c3                   	ret    
  2002b7:	31 d2                	xor    %edx,%edx
  2002b9:	8d 76 00             	lea    0x0(%esi),%esi
  2002bc:	42                   	inc    %edx
  2002bd:	80 bc 0a 5e e5 ff ff 	cmpb   $0x0,-0x1aa2(%edx,%ecx,1)
  2002c4:	00 
  2002c5:	75 f5                	jne    2002bc <printd+0x114>
  2002c7:	31 f6                	xor    %esi,%esi
  2002c9:	8d 89 5e e5 ff ff    	lea    -0x1aa2(%ecx),%ecx
  2002cf:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002d4:	b8 04 00 00 00       	mov    $0x4,%eax
  2002d9:	89 f7                	mov    %esi,%edi
  2002db:	cd 80                	int    $0x80
  2002dd:	83 c4 78             	add    $0x78,%esp
  2002e0:	5b                   	pop    %ebx
  2002e1:	5e                   	pop    %esi
  2002e2:	5f                   	pop    %edi
  2002e3:	5d                   	pop    %ebp
  2002e4:	c3                   	ret    
  2002e5:	ba 01 00 00 00       	mov    $0x1,%edx
  2002ea:	31 f6                	xor    %esi,%esi
  2002ec:	8d 89 6a e5 ff ff    	lea    -0x1a96(%ecx),%ecx
  2002f2:	b8 04 00 00 00       	mov    $0x4,%eax
  2002f7:	89 d3                	mov    %edx,%ebx
  2002f9:	89 f7                	mov    %esi,%edi
  2002fb:	cd 80                	int    $0x80
  2002fd:	f7 5d 08             	negl   0x8(%ebp)
  200300:	e9 f7 fe ff ff       	jmp    2001fc <printd+0x54>
  200305:	31 d2                	xor    %edx,%edx
  200307:	eb 90                	jmp    200299 <printd+0xf1>
  200309:	8d 76 00             	lea    0x0(%esi),%esi

0020030c <printx>:
  20030c:	55                   	push   %ebp
  20030d:	89 e5                	mov    %esp,%ebp
  20030f:	57                   	push   %edi
  200310:	56                   	push   %esi
  200311:	53                   	push   %ebx
  200312:	83 ec 70             	sub    $0x70,%esp
  200315:	e8 de 01 00 00       	call   2004f8 <__x86.get_pc_thunk.ax>
  20031a:	05 e6 1c 00 00       	add    $0x1ce6,%eax
  20031f:	8b 75 08             	mov    0x8(%ebp),%esi
  200322:	85 f6                	test   %esi,%esi
  200324:	75 1e                	jne    200344 <printx+0x38>
  200326:	ba 01 00 00 00       	mov    $0x1,%edx
  20032b:	8d 88 5c e5 ff ff    	lea    -0x1aa4(%eax),%ecx
  200331:	b8 04 00 00 00       	mov    $0x4,%eax
  200336:	89 d3                	mov    %edx,%ebx
  200338:	89 f7                	mov    %esi,%edi
  20033a:	cd 80                	int    $0x80
  20033c:	83 c4 70             	add    $0x70,%esp
  20033f:	5b                   	pop    %ebx
  200340:	5e                   	pop    %esi
  200341:	5f                   	pop    %edi
  200342:	5d                   	pop    %ebp
  200343:	c3                   	ret    
  200344:	31 d2                	xor    %edx,%edx
  200346:	8d 4d 90             	lea    -0x70(%ebp),%ecx
  200349:	eb 11                	jmp    20035c <printx+0x50>
  20034b:	90                   	nop
  20034c:	83 c0 57             	add    $0x57,%eax
  20034f:	88 04 11             	mov    %al,(%ecx,%edx,1)
  200352:	8d 7a 01             	lea    0x1(%edx),%edi
  200355:	c1 ee 04             	shr    $0x4,%esi
  200358:	74 1a                	je     200374 <printx+0x68>
  20035a:	89 fa                	mov    %edi,%edx
  20035c:	89 f0                	mov    %esi,%eax
  20035e:	83 e0 0f             	and    $0xf,%eax
  200361:	83 f8 09             	cmp    $0x9,%eax
  200364:	77 e6                	ja     20034c <printx+0x40>
  200366:	83 c0 30             	add    $0x30,%eax
  200369:	88 04 11             	mov    %al,(%ecx,%edx,1)
  20036c:	8d 7a 01             	lea    0x1(%edx),%edi
  20036f:	c1 ee 04             	shr    $0x4,%esi
  200372:	75 e6                	jne    20035a <printx+0x4e>
  200374:	85 d2                	test   %edx,%edx
  200376:	74 19                	je     200391 <printx+0x85>
  200378:	31 c0                	xor    %eax,%eax
  20037a:	66 90                	xchg   %ax,%ax
  20037c:	0f b6 34 01          	movzbl (%ecx,%eax,1),%esi
  200380:	8a 1c 11             	mov    (%ecx,%edx,1),%bl
  200383:	88 1c 01             	mov    %bl,(%ecx,%eax,1)
  200386:	89 f3                	mov    %esi,%ebx
  200388:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
  20038b:	40                   	inc    %eax
  20038c:	4a                   	dec    %edx
  20038d:	39 d0                	cmp    %edx,%eax
  20038f:	7c eb                	jl     20037c <printx+0x70>
  200391:	c6 44 3d 90 00       	movb   $0x0,-0x70(%ebp,%edi,1)
  200396:	31 c0                	xor    %eax,%eax
  200398:	31 d2                	xor    %edx,%edx
  20039a:	80 7d 90 00          	cmpb   $0x0,-0x70(%ebp)
  20039e:	74 09                	je     2003a9 <printx+0x9d>
  2003a0:	40                   	inc    %eax
  2003a1:	89 c2                	mov    %eax,%edx
  2003a3:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  2003a7:	75 f7                	jne    2003a0 <printx+0x94>
  2003a9:	31 f6                	xor    %esi,%esi
  2003ab:	bb 01 00 00 00       	mov    $0x1,%ebx
  2003b0:	b8 04 00 00 00       	mov    $0x4,%eax
  2003b5:	89 f7                	mov    %esi,%edi
  2003b7:	cd 80                	int    $0x80
  2003b9:	83 c4 70             	add    $0x70,%esp
  2003bc:	5b                   	pop    %ebx
  2003bd:	5e                   	pop    %esi
  2003be:	5f                   	pop    %edi
  2003bf:	5d                   	pop    %ebp
  2003c0:	c3                   	ret    
  2003c1:	8d 76 00             	lea    0x0(%esi),%esi

002003c4 <printf>:
  2003c4:	55                   	push   %ebp
  2003c5:	89 e5                	mov    %esp,%ebp
  2003c7:	57                   	push   %edi
  2003c8:	56                   	push   %esi
  2003c9:	53                   	push   %ebx
  2003ca:	83 ec 20             	sub    $0x20,%esp
  2003cd:	8d 45 0c             	lea    0xc(%ebp),%eax
  2003d0:	89 45 d8             	mov    %eax,-0x28(%ebp)
  2003d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2003d6:	85 c9                	test   %ecx,%ecx
  2003d8:	0f 84 92 00 00 00    	je     200470 <printf+0xac>
  2003de:	8b 45 08             	mov    0x8(%ebp),%eax
  2003e1:	8a 00                	mov    (%eax),%al
  2003e3:	84 c0                	test   %al,%al
  2003e5:	0f 84 85 00 00 00    	je     200470 <printf+0xac>
  2003eb:	8d 75 f2             	lea    -0xe(%ebp),%esi
  2003ee:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  2003f1:	8d 7d f3             	lea    -0xd(%ebp),%edi
  2003f4:	89 7d dc             	mov    %edi,-0x24(%ebp)
  2003f7:	eb 31                	jmp    20042a <printf+0x66>
  2003f9:	8d 76 00             	lea    0x0(%esi),%esi
  2003fc:	88 45 f3             	mov    %al,-0xd(%ebp)
  2003ff:	ba 01 00 00 00       	mov    $0x1,%edx
  200404:	31 f6                	xor    %esi,%esi
  200406:	b8 04 00 00 00       	mov    $0x4,%eax
  20040b:	89 d3                	mov    %edx,%ebx
  20040d:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  200410:	89 f7                	mov    %esi,%edi
  200412:	cd 80                	int    $0x80
  200414:	8b 45 08             	mov    0x8(%ebp),%eax
  200417:	89 45 e0             	mov    %eax,-0x20(%ebp)
  20041a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  20041d:	89 d8                	mov    %ebx,%eax
  20041f:	40                   	inc    %eax
  200420:	89 45 08             	mov    %eax,0x8(%ebp)
  200423:	8a 43 01             	mov    0x1(%ebx),%al
  200426:	84 c0                	test   %al,%al
  200428:	74 46                	je     200470 <printf+0xac>
  20042a:	3c 25                	cmp    $0x25,%al
  20042c:	75 ce                	jne    2003fc <printf+0x38>
  20042e:	8b 45 08             	mov    0x8(%ebp),%eax
  200431:	40                   	inc    %eax
  200432:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200435:	8b 45 08             	mov    0x8(%ebp),%eax
  200438:	8a 40 01             	mov    0x1(%eax),%al
  20043b:	3c 64                	cmp    $0x64,%al
  20043d:	0f 84 99 00 00 00    	je     2004dc <printf+0x118>
  200443:	7e 33                	jle    200478 <printf+0xb4>
  200445:	3c 73                	cmp    $0x73,%al
  200447:	74 5f                	je     2004a8 <printf+0xe4>
  200449:	3c 78                	cmp    $0x78,%al
  20044b:	75 cd                	jne    20041a <printf+0x56>
  20044d:	8b 7d d8             	mov    -0x28(%ebp),%edi
  200450:	89 f8                	mov    %edi,%eax
  200452:	83 c7 04             	add    $0x4,%edi
  200455:	89 7d d8             	mov    %edi,-0x28(%ebp)
  200458:	ff 30                	pushl  (%eax)
  20045a:	e8 ad fe ff ff       	call   20030c <printx>
  20045f:	58                   	pop    %eax
  200460:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  200463:	89 d8                	mov    %ebx,%eax
  200465:	40                   	inc    %eax
  200466:	89 45 08             	mov    %eax,0x8(%ebp)
  200469:	8a 43 01             	mov    0x1(%ebx),%al
  20046c:	84 c0                	test   %al,%al
  20046e:	75 ba                	jne    20042a <printf+0x66>
  200470:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200473:	5b                   	pop    %ebx
  200474:	5e                   	pop    %esi
  200475:	5f                   	pop    %edi
  200476:	5d                   	pop    %ebp
  200477:	c3                   	ret    
  200478:	3c 63                	cmp    $0x63,%al
  20047a:	75 9e                	jne    20041a <printf+0x56>
  20047c:	8b 7d d8             	mov    -0x28(%ebp),%edi
  20047f:	89 f8                	mov    %edi,%eax
  200481:	83 c7 04             	add    $0x4,%edi
  200484:	89 7d d8             	mov    %edi,-0x28(%ebp)
  200487:	8b 00                	mov    (%eax),%eax
  200489:	88 45 f2             	mov    %al,-0xe(%ebp)
  20048c:	ba 01 00 00 00       	mov    $0x1,%edx
  200491:	31 f6                	xor    %esi,%esi
  200493:	b8 04 00 00 00       	mov    $0x4,%eax
  200498:	89 d3                	mov    %edx,%ebx
  20049a:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  20049d:	89 f7                	mov    %esi,%edi
  20049f:	cd 80                	int    $0x80
  2004a1:	e9 74 ff ff ff       	jmp    20041a <printf+0x56>
  2004a6:	66 90                	xchg   %ax,%ax
  2004a8:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  2004ab:	89 c8                	mov    %ecx,%eax
  2004ad:	83 c1 04             	add    $0x4,%ecx
  2004b0:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  2004b3:	8b 08                	mov    (%eax),%ecx
  2004b5:	80 39 00             	cmpb   $0x0,(%ecx)
  2004b8:	74 3a                	je     2004f4 <printf+0x130>
  2004ba:	31 c0                	xor    %eax,%eax
  2004bc:	40                   	inc    %eax
  2004bd:	89 c2                	mov    %eax,%edx
  2004bf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  2004c3:	75 f7                	jne    2004bc <printf+0xf8>
  2004c5:	31 f6                	xor    %esi,%esi
  2004c7:	bb 01 00 00 00       	mov    $0x1,%ebx
  2004cc:	b8 04 00 00 00       	mov    $0x4,%eax
  2004d1:	89 f7                	mov    %esi,%edi
  2004d3:	cd 80                	int    $0x80
  2004d5:	e9 40 ff ff ff       	jmp    20041a <printf+0x56>
  2004da:	66 90                	xchg   %ax,%ax
  2004dc:	8b 7d d8             	mov    -0x28(%ebp),%edi
  2004df:	89 f8                	mov    %edi,%eax
  2004e1:	83 c7 04             	add    $0x4,%edi
  2004e4:	89 7d d8             	mov    %edi,-0x28(%ebp)
  2004e7:	ff 30                	pushl  (%eax)
  2004e9:	e8 ba fc ff ff       	call   2001a8 <printd>
  2004ee:	5a                   	pop    %edx
  2004ef:	e9 26 ff ff ff       	jmp    20041a <printf+0x56>
  2004f4:	31 d2                	xor    %edx,%edx
  2004f6:	eb cd                	jmp    2004c5 <printf+0x101>

002004f8 <__x86.get_pc_thunk.ax>:
  2004f8:	8b 04 24             	mov    (%esp),%eax
  2004fb:	c3                   	ret    

002004fc <__x86.get_pc_thunk.cx>:
  2004fc:	8b 0c 24             	mov    (%esp),%ecx
  2004ff:	c3                   	ret    

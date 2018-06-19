
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <initIntr>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	ba 21 00 00 00       	mov    $0x21,%edx
  100008:	b0 ff                	mov    $0xff,%al
  10000a:	ee                   	out    %al,(%dx)
  10000b:	ba a1 00 00 00       	mov    $0xa1,%edx
  100010:	ee                   	out    %al,(%dx)
  100011:	ba 20 00 00 00       	mov    $0x20,%edx
  100016:	b0 11                	mov    $0x11,%al
  100018:	ee                   	out    %al,(%dx)
  100019:	ba 21 00 00 00       	mov    $0x21,%edx
  10001e:	b0 20                	mov    $0x20,%al
  100020:	ee                   	out    %al,(%dx)
  100021:	b0 04                	mov    $0x4,%al
  100023:	ee                   	out    %al,(%dx)
  100024:	b0 03                	mov    $0x3,%al
  100026:	ee                   	out    %al,(%dx)
  100027:	ba a0 00 00 00       	mov    $0xa0,%edx
  10002c:	b0 11                	mov    $0x11,%al
  10002e:	ee                   	out    %al,(%dx)
  10002f:	ba a1 00 00 00       	mov    $0xa1,%edx
  100034:	b0 28                	mov    $0x28,%al
  100036:	ee                   	out    %al,(%dx)
  100037:	b0 02                	mov    $0x2,%al
  100039:	ee                   	out    %al,(%dx)
  10003a:	b0 03                	mov    $0x3,%al
  10003c:	ee                   	out    %al,(%dx)
  10003d:	ba 20 00 00 00       	mov    $0x20,%edx
  100042:	b0 68                	mov    $0x68,%al
  100044:	ee                   	out    %al,(%dx)
  100045:	b0 0a                	mov    $0xa,%al
  100047:	ee                   	out    %al,(%dx)
  100048:	ba a0 00 00 00       	mov    $0xa0,%edx
  10004d:	b0 68                	mov    $0x68,%al
  10004f:	ee                   	out    %al,(%dx)
  100050:	b0 0a                	mov    $0xa,%al
  100052:	ee                   	out    %al,(%dx)
  100053:	5d                   	pop    %ebp
  100054:	c3                   	ret    
  100055:	8d 76 00             	lea    0x0(%esi),%esi

00100058 <initTimer>:
  100058:	55                   	push   %ebp
  100059:	89 e5                	mov    %esp,%ebp
  10005b:	ba 43 00 00 00       	mov    $0x43,%edx
  100060:	b0 34                	mov    $0x34,%al
  100062:	ee                   	out    %al,(%dx)
  100063:	ba 40 00 00 00       	mov    $0x40,%edx
  100068:	b0 9b                	mov    $0x9b,%al
  10006a:	ee                   	out    %al,(%dx)
  10006b:	b0 2e                	mov    $0x2e,%al
  10006d:	ee                   	out    %al,(%dx)
  10006e:	5d                   	pop    %ebp
  10006f:	c3                   	ret    

00100070 <initIdt>:
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	57                   	push   %edi
  100074:	56                   	push   %esi
  100075:	53                   	push   %ebx
  100076:	e8 5d 03 00 00       	call   1003d8 <__x86.get_pc_thunk.bx>
  10007b:	81 c3 85 2f 00 00    	add    $0x2f85,%ebx
  100081:	c7 c1 9f 10 10 00    	mov    $0x10109f,%ecx
  100087:	89 ce                	mov    %ecx,%esi
  100089:	c1 e9 10             	shr    $0x10,%ecx
  10008c:	c7 c2 c0 b1 31 00    	mov    $0x31b1c0,%edx
  100092:	8d ba 00 08 00 00    	lea    0x800(%edx),%edi
  100098:	89 d0                	mov    %edx,%eax
  10009a:	66 90                	xchg   %ax,%ax
  10009c:	66 89 30             	mov    %si,(%eax)
  10009f:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1000a5:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1000a9:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1000ad:	66 89 48 06          	mov    %cx,0x6(%eax)
  1000b1:	83 c0 08             	add    $0x8,%eax
  1000b4:	39 c7                	cmp    %eax,%edi
  1000b6:	75 e4                	jne    10009c <initIdt+0x2c>
  1000b8:	c7 c7 51 10 10 00    	mov    $0x101051,%edi
  1000be:	66 89 3a             	mov    %di,(%edx)
  1000c1:	66 c7 42 02 08 00    	movw   $0x8,0x2(%edx)
  1000c7:	c6 42 04 00          	movb   $0x0,0x4(%edx)
  1000cb:	8a 42 05             	mov    0x5(%edx),%al
  1000ce:	83 c8 0f             	or     $0xf,%eax
  1000d1:	83 e0 8f             	and    $0xffffff8f,%eax
  1000d4:	83 c8 80             	or     $0xffffff80,%eax
  1000d7:	88 42 05             	mov    %al,0x5(%edx)
  1000da:	c1 ef 10             	shr    $0x10,%edi
  1000dd:	66 89 7a 06          	mov    %di,0x6(%edx)
  1000e1:	c7 c7 57 10 10 00    	mov    $0x101057,%edi
  1000e7:	66 89 7a 08          	mov    %di,0x8(%edx)
  1000eb:	66 c7 42 0a 08 00    	movw   $0x8,0xa(%edx)
  1000f1:	c6 42 0c 00          	movb   $0x0,0xc(%edx)
  1000f5:	8a 42 0d             	mov    0xd(%edx),%al
  1000f8:	83 c8 0f             	or     $0xf,%eax
  1000fb:	83 e0 8f             	and    $0xffffff8f,%eax
  1000fe:	83 c8 80             	or     $0xffffff80,%eax
  100101:	88 42 0d             	mov    %al,0xd(%edx)
  100104:	89 f9                	mov    %edi,%ecx
  100106:	c1 e9 10             	shr    $0x10,%ecx
  100109:	66 89 4a 0e          	mov    %cx,0xe(%edx)
  10010d:	c7 c7 5d 10 10 00    	mov    $0x10105d,%edi
  100113:	66 89 7a 10          	mov    %di,0x10(%edx)
  100117:	66 c7 42 12 08 00    	movw   $0x8,0x12(%edx)
  10011d:	c6 42 14 00          	movb   $0x0,0x14(%edx)
  100121:	8a 42 15             	mov    0x15(%edx),%al
  100124:	83 c8 0f             	or     $0xf,%eax
  100127:	83 e0 8f             	and    $0xffffff8f,%eax
  10012a:	83 c8 80             	or     $0xffffff80,%eax
  10012d:	88 42 15             	mov    %al,0x15(%edx)
  100130:	c1 ef 10             	shr    $0x10,%edi
  100133:	66 89 7a 16          	mov    %di,0x16(%edx)
  100137:	c7 c7 63 10 10 00    	mov    $0x101063,%edi
  10013d:	66 89 7a 18          	mov    %di,0x18(%edx)
  100141:	66 c7 42 1a 08 00    	movw   $0x8,0x1a(%edx)
  100147:	c6 42 1c 00          	movb   $0x0,0x1c(%edx)
  10014b:	8a 42 1d             	mov    0x1d(%edx),%al
  10014e:	83 c8 0f             	or     $0xf,%eax
  100151:	83 e0 8f             	and    $0xffffff8f,%eax
  100154:	83 c8 80             	or     $0xffffff80,%eax
  100157:	88 42 1d             	mov    %al,0x1d(%edx)
  10015a:	89 f9                	mov    %edi,%ecx
  10015c:	c1 e9 10             	shr    $0x10,%ecx
  10015f:	66 89 4a 1e          	mov    %cx,0x1e(%edx)
  100163:	c7 c7 69 10 10 00    	mov    $0x101069,%edi
  100169:	66 89 7a 20          	mov    %di,0x20(%edx)
  10016d:	66 c7 42 22 08 00    	movw   $0x8,0x22(%edx)
  100173:	c6 42 24 00          	movb   $0x0,0x24(%edx)
  100177:	8a 42 25             	mov    0x25(%edx),%al
  10017a:	83 c8 0f             	or     $0xf,%eax
  10017d:	83 e0 8f             	and    $0xffffff8f,%eax
  100180:	83 c8 80             	or     $0xffffff80,%eax
  100183:	88 42 25             	mov    %al,0x25(%edx)
  100186:	c1 ef 10             	shr    $0x10,%edi
  100189:	66 89 7a 26          	mov    %di,0x26(%edx)
  10018d:	c7 c7 6f 10 10 00    	mov    $0x10106f,%edi
  100193:	66 89 7a 28          	mov    %di,0x28(%edx)
  100197:	66 c7 42 2a 08 00    	movw   $0x8,0x2a(%edx)
  10019d:	c6 42 2c 00          	movb   $0x0,0x2c(%edx)
  1001a1:	8a 42 2d             	mov    0x2d(%edx),%al
  1001a4:	83 c8 0f             	or     $0xf,%eax
  1001a7:	83 e0 8f             	and    $0xffffff8f,%eax
  1001aa:	83 c8 80             	or     $0xffffff80,%eax
  1001ad:	88 42 2d             	mov    %al,0x2d(%edx)
  1001b0:	89 f9                	mov    %edi,%ecx
  1001b2:	c1 e9 10             	shr    $0x10,%ecx
  1001b5:	66 89 4a 2e          	mov    %cx,0x2e(%edx)
  1001b9:	c7 c7 75 10 10 00    	mov    $0x101075,%edi
  1001bf:	66 89 7a 30          	mov    %di,0x30(%edx)
  1001c3:	66 c7 42 32 08 00    	movw   $0x8,0x32(%edx)
  1001c9:	c6 42 34 00          	movb   $0x0,0x34(%edx)
  1001cd:	8a 42 35             	mov    0x35(%edx),%al
  1001d0:	83 c8 0f             	or     $0xf,%eax
  1001d3:	83 e0 8f             	and    $0xffffff8f,%eax
  1001d6:	83 c8 80             	or     $0xffffff80,%eax
  1001d9:	88 42 35             	mov    %al,0x35(%edx)
  1001dc:	c1 ef 10             	shr    $0x10,%edi
  1001df:	66 89 7a 36          	mov    %di,0x36(%edx)
  1001e3:	c7 c7 7b 10 10 00    	mov    $0x10107b,%edi
  1001e9:	66 89 7a 38          	mov    %di,0x38(%edx)
  1001ed:	66 c7 42 3a 08 00    	movw   $0x8,0x3a(%edx)
  1001f3:	c6 42 3c 00          	movb   $0x0,0x3c(%edx)
  1001f7:	8a 42 3d             	mov    0x3d(%edx),%al
  1001fa:	83 c8 0f             	or     $0xf,%eax
  1001fd:	83 e0 8f             	and    $0xffffff8f,%eax
  100200:	83 c8 80             	or     $0xffffff80,%eax
  100203:	88 42 3d             	mov    %al,0x3d(%edx)
  100206:	89 f9                	mov    %edi,%ecx
  100208:	c1 e9 10             	shr    $0x10,%ecx
  10020b:	66 89 4a 3e          	mov    %cx,0x3e(%edx)
  10020f:	c7 c7 81 10 10 00    	mov    $0x101081,%edi
  100215:	66 89 7a 40          	mov    %di,0x40(%edx)
  100219:	66 c7 42 42 08 00    	movw   $0x8,0x42(%edx)
  10021f:	c6 42 44 00          	movb   $0x0,0x44(%edx)
  100223:	8a 42 45             	mov    0x45(%edx),%al
  100226:	83 c8 0f             	or     $0xf,%eax
  100229:	83 e0 8f             	and    $0xffffff8f,%eax
  10022c:	83 c8 80             	or     $0xffffff80,%eax
  10022f:	88 42 45             	mov    %al,0x45(%edx)
  100232:	c1 ef 10             	shr    $0x10,%edi
  100235:	66 89 7a 46          	mov    %di,0x46(%edx)
  100239:	c7 c7 85 10 10 00    	mov    $0x101085,%edi
  10023f:	66 89 7a 48          	mov    %di,0x48(%edx)
  100243:	66 c7 42 4a 08 00    	movw   $0x8,0x4a(%edx)
  100249:	c6 42 4c 00          	movb   $0x0,0x4c(%edx)
  10024d:	8a 42 4d             	mov    0x4d(%edx),%al
  100250:	83 c8 0f             	or     $0xf,%eax
  100253:	83 e0 8f             	and    $0xffffff8f,%eax
  100256:	83 c8 80             	or     $0xffffff80,%eax
  100259:	88 42 4d             	mov    %al,0x4d(%edx)
  10025c:	c1 ef 10             	shr    $0x10,%edi
  10025f:	66 89 7a 4e          	mov    %di,0x4e(%edx)
  100263:	c7 c7 8b 10 10 00    	mov    $0x10108b,%edi
  100269:	66 89 7a 50          	mov    %di,0x50(%edx)
  10026d:	66 c7 42 52 08 00    	movw   $0x8,0x52(%edx)
  100273:	c6 42 54 00          	movb   $0x0,0x54(%edx)
  100277:	8a 42 55             	mov    0x55(%edx),%al
  10027a:	83 c8 0f             	or     $0xf,%eax
  10027d:	83 e0 8f             	and    $0xffffff8f,%eax
  100280:	83 c8 80             	or     $0xffffff80,%eax
  100283:	88 42 55             	mov    %al,0x55(%edx)
  100286:	c1 ef 10             	shr    $0x10,%edi
  100289:	66 89 7a 56          	mov    %di,0x56(%edx)
  10028d:	c7 c7 8f 10 10 00    	mov    $0x10108f,%edi
  100293:	66 89 7a 58          	mov    %di,0x58(%edx)
  100297:	66 c7 42 5a 08 00    	movw   $0x8,0x5a(%edx)
  10029d:	c6 42 5c 00          	movb   $0x0,0x5c(%edx)
  1002a1:	8a 42 5d             	mov    0x5d(%edx),%al
  1002a4:	83 c8 0f             	or     $0xf,%eax
  1002a7:	83 e0 8f             	and    $0xffffff8f,%eax
  1002aa:	83 c8 80             	or     $0xffffff80,%eax
  1002ad:	88 42 5d             	mov    %al,0x5d(%edx)
  1002b0:	c1 ef 10             	shr    $0x10,%edi
  1002b3:	66 89 7a 5e          	mov    %di,0x5e(%edx)
  1002b7:	c7 c7 93 10 10 00    	mov    $0x101093,%edi
  1002bd:	66 89 7a 60          	mov    %di,0x60(%edx)
  1002c1:	66 c7 42 62 08 00    	movw   $0x8,0x62(%edx)
  1002c7:	c6 42 64 00          	movb   $0x0,0x64(%edx)
  1002cb:	8a 42 65             	mov    0x65(%edx),%al
  1002ce:	83 c8 0f             	or     $0xf,%eax
  1002d1:	83 e0 8f             	and    $0xffffff8f,%eax
  1002d4:	83 c8 80             	or     $0xffffff80,%eax
  1002d7:	88 42 65             	mov    %al,0x65(%edx)
  1002da:	c1 ef 10             	shr    $0x10,%edi
  1002dd:	66 89 7a 66          	mov    %di,0x66(%edx)
  1002e1:	66 c7 42 6a 08 00    	movw   $0x8,0x6a(%edx)
  1002e7:	c6 42 6c 00          	movb   $0x0,0x6c(%edx)
  1002eb:	8a 42 6d             	mov    0x6d(%edx),%al
  1002ee:	83 c8 0f             	or     $0xf,%eax
  1002f1:	83 e0 8f             	and    $0xffffff8f,%eax
  1002f4:	83 c8 80             	or     $0xffffff80,%eax
  1002f7:	88 42 6d             	mov    %al,0x6d(%edx)
  1002fa:	c7 c7 9b 10 10 00    	mov    $0x10109b,%edi
  100300:	66 89 7a 70          	mov    %di,0x70(%edx)
  100304:	66 c7 42 72 08 00    	movw   $0x8,0x72(%edx)
  10030a:	c6 42 74 00          	movb   $0x0,0x74(%edx)
  10030e:	8a 42 75             	mov    0x75(%edx),%al
  100311:	83 c8 0f             	or     $0xf,%eax
  100314:	83 e0 8f             	and    $0xffffff8f,%eax
  100317:	83 c8 80             	or     $0xffffff80,%eax
  10031a:	88 42 75             	mov    %al,0x75(%edx)
  10031d:	c1 ef 10             	shr    $0x10,%edi
  100320:	66 89 7a 76          	mov    %di,0x76(%edx)
  100324:	c7 c0 a5 10 10 00    	mov    $0x1010a5,%eax
  10032a:	66 89 42 68          	mov    %ax,0x68(%edx)
  10032e:	c1 e8 10             	shr    $0x10,%eax
  100331:	66 89 42 6e          	mov    %ax,0x6e(%edx)
  100335:	c7 c7 a9 10 10 00    	mov    $0x1010a9,%edi
  10033b:	66 89 ba 00 01 00 00 	mov    %di,0x100(%edx)
  100342:	66 c7 82 02 01 00 00 	movw   $0x8,0x102(%edx)
  100349:	08 00 
  10034b:	c6 82 04 01 00 00 00 	movb   $0x0,0x104(%edx)
  100352:	8a 82 05 01 00 00    	mov    0x105(%edx),%al
  100358:	83 e0 f0             	and    $0xfffffff0,%eax
  10035b:	83 c8 0e             	or     $0xe,%eax
  10035e:	83 e0 8f             	and    $0xffffff8f,%eax
  100361:	83 c8 80             	or     $0xffffff80,%eax
  100364:	88 82 05 01 00 00    	mov    %al,0x105(%edx)
  10036a:	c1 ef 10             	shr    $0x10,%edi
  10036d:	66 89 ba 06 01 00 00 	mov    %di,0x106(%edx)
  100374:	c7 c7 af 10 10 00    	mov    $0x1010af,%edi
  10037a:	66 89 ba 00 04 00 00 	mov    %di,0x400(%edx)
  100381:	66 c7 82 02 04 00 00 	movw   $0x8,0x402(%edx)
  100388:	08 00 
  10038a:	c6 82 04 04 00 00 00 	movb   $0x0,0x404(%edx)
  100391:	8a 82 05 04 00 00    	mov    0x405(%edx),%al
  100397:	83 c8 0f             	or     $0xf,%eax
  10039a:	83 e0 ef             	and    $0xffffffef,%eax
  10039d:	83 c8 e0             	or     $0xffffffe0,%eax
  1003a0:	88 82 05 04 00 00    	mov    %al,0x405(%edx)
  1003a6:	c1 ef 10             	shr    $0x10,%edi
  1003a9:	66 89 ba 06 04 00 00 	mov    %di,0x406(%edx)
  1003b0:	66 c7 83 40 01 00 00 	movw   $0x7ff,0x140(%ebx)
  1003b7:	ff 07 
  1003b9:	66 89 93 42 01 00 00 	mov    %dx,0x142(%ebx)
  1003c0:	c1 ea 10             	shr    $0x10,%edx
  1003c3:	66 89 93 44 01 00 00 	mov    %dx,0x144(%ebx)
  1003ca:	8d 83 40 01 00 00    	lea    0x140(%ebx),%eax
  1003d0:	0f 01 18             	lidtl  (%eax)
  1003d3:	5b                   	pop    %ebx
  1003d4:	5e                   	pop    %esi
  1003d5:	5f                   	pop    %edi
  1003d6:	5d                   	pop    %ebp
  1003d7:	c3                   	ret    

001003d8 <__x86.get_pc_thunk.bx>:
  1003d8:	8b 1c 24             	mov    (%esp),%ebx
  1003db:	c3                   	ret    

001003dc <sys_write>:
  1003dc:	55                   	push   %ebp
  1003dd:	89 e5                	mov    %esp,%ebp
  1003df:	57                   	push   %edi
  1003e0:	56                   	push   %esi
  1003e1:	53                   	push   %ebx
  1003e2:	83 ec 1c             	sub    $0x1c,%esp
  1003e5:	e8 ee ff ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  1003ea:	81 c3 16 2c 00 00    	add    $0x2c16,%ebx
  1003f0:	b8 30 00 00 00       	mov    $0x30,%eax
  1003f5:	89 c0                	mov    %eax,%eax
  1003f7:	8e e8                	mov    %eax,%gs
  1003f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1003fc:	8b 40 20             	mov    0x20(%eax),%eax
  1003ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100402:	48                   	dec    %eax
  100403:	83 f8 01             	cmp    $0x1,%eax
  100406:	76 1c                	jbe    100424 <sys_write+0x48>
  100408:	83 ec 08             	sub    $0x8,%esp
  10040b:	6a 53                	push   $0x53
  10040d:	8d 83 d8 e0 ff ff    	lea    -0x1f28(%ebx),%eax
  100413:	50                   	push   %eax
  100414:	e8 5f 0b 00 00       	call   100f78 <abort>
  100419:	83 c4 10             	add    $0x10,%esp
  10041c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10041f:	5b                   	pop    %ebx
  100420:	5e                   	pop    %esi
  100421:	5f                   	pop    %edi
  100422:	5d                   	pop    %ebp
  100423:	c3                   	ret    
  100424:	8b 45 08             	mov    0x8(%ebp),%eax
  100427:	8b 40 24             	mov    0x24(%eax),%eax
  10042a:	89 45 dc             	mov    %eax,-0x24(%ebp)
  10042d:	85 c0                	test   %eax,%eax
  10042f:	7e 70                	jle    1004a1 <sys_write+0xc5>
  100431:	8b 45 08             	mov    0x8(%ebp),%eax
  100434:	8b 70 28             	mov    0x28(%eax),%esi
  100437:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10043a:	01 f0                	add    %esi,%eax
  10043c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10043f:	eb 2f                	jmp    100470 <sys_write+0x94>
  100441:	8d 76 00             	lea    0x0(%esi),%esi
  100444:	8b 83 4c 01 00 00    	mov    0x14c(%ebx),%eax
  10044a:	83 f8 50             	cmp    $0x50,%eax
  10044d:	74 65                	je     1004b4 <sys_write+0xd8>
  10044f:	8d 48 01             	lea    0x1(%eax),%ecx
  100452:	8b 93 20 00 00 00    	mov    0x20(%ebx),%edx
  100458:	89 8b 4c 01 00 00    	mov    %ecx,0x14c(%ebx)
  10045e:	51                   	push   %ecx
  10045f:	57                   	push   %edi
  100460:	50                   	push   %eax
  100461:	52                   	push   %edx
  100462:	e8 ed 0a 00 00       	call   100f54 <video_print>
  100467:	83 c4 10             	add    $0x10,%esp
  10046a:	46                   	inc    %esi
  10046b:	39 75 e0             	cmp    %esi,-0x20(%ebp)
  10046e:	74 31                	je     1004a1 <sys_write+0xc5>
  100470:	0f be 3e             	movsbl (%esi),%edi
  100473:	89 f8                	mov    %edi,%eax
  100475:	88 45 e4             	mov    %al,-0x1c(%ebp)
  100478:	83 ec 0c             	sub    $0xc,%esp
  10047b:	57                   	push   %edi
  10047c:	e8 b7 0a 00 00       	call   100f38 <putChar>
  100481:	83 c4 10             	add    $0x10,%esp
  100484:	8a 45 e4             	mov    -0x1c(%ebp),%al
  100487:	3c 0a                	cmp    $0xa,%al
  100489:	75 b9                	jne    100444 <sys_write+0x68>
  10048b:	ff 83 20 00 00 00    	incl   0x20(%ebx)
  100491:	c7 83 4c 01 00 00 00 	movl   $0x0,0x14c(%ebx)
  100498:	00 00 00 
  10049b:	46                   	inc    %esi
  10049c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
  10049f:	75 cf                	jne    100470 <sys_write+0x94>
  1004a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1004a4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1004a7:	89 48 2c             	mov    %ecx,0x2c(%eax)
  1004aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1004ad:	5b                   	pop    %ebx
  1004ae:	5e                   	pop    %esi
  1004af:	5f                   	pop    %edi
  1004b0:	5d                   	pop    %ebp
  1004b1:	c3                   	ret    
  1004b2:	66 90                	xchg   %ax,%ax
  1004b4:	8b 83 20 00 00 00    	mov    0x20(%ebx),%eax
  1004ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1004bd:	8d 50 01             	lea    0x1(%eax),%edx
  1004c0:	89 93 20 00 00 00    	mov    %edx,0x20(%ebx)
  1004c6:	b9 01 00 00 00       	mov    $0x1,%ecx
  1004cb:	31 c0                	xor    %eax,%eax
  1004cd:	eb 89                	jmp    100458 <sys_write+0x7c>
  1004cf:	90                   	nop

001004d0 <sys_exit>:
  1004d0:	55                   	push   %ebp
  1004d1:	89 e5                	mov    %esp,%ebp
  1004d3:	53                   	push   %ebx
  1004d4:	50                   	push   %eax
  1004d5:	e8 fe fe ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  1004da:	81 c3 26 2b 00 00    	add    $0x2b26,%ebx
  1004e0:	c7 c0 a0 b1 31 00    	mov    $0x31b1a0,%eax
  1004e6:	8b 10                	mov    (%eax),%edx
  1004e8:	c7 82 4c 08 00 00 03 	movl   $0x3,0x84c(%edx)
  1004ef:	00 00 00 
  1004f2:	c7 c1 80 31 10 00    	mov    $0x103180,%ecx
  1004f8:	8b 09                	mov    (%ecx),%ecx
  1004fa:	89 91 5c 08 00 00    	mov    %edx,0x85c(%ecx)
  100500:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  100506:	e8 79 06 00 00       	call   100b84 <schedule>
  10050b:	5a                   	pop    %edx
  10050c:	5b                   	pop    %ebx
  10050d:	5d                   	pop    %ebp
  10050e:	c3                   	ret    
  10050f:	90                   	nop

00100510 <sys_fork>:
  100510:	55                   	push   %ebp
  100511:	89 e5                	mov    %esp,%ebp
  100513:	57                   	push   %edi
  100514:	56                   	push   %esi
  100515:	53                   	push   %ebx
  100516:	83 ec 1c             	sub    $0x1c,%esp
  100519:	e8 ba fe ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  10051e:	81 c3 e2 2a 00 00    	add    $0x2ae2,%ebx
  100524:	e8 5f 08 00 00       	call   100d88 <newPCB>
  100529:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10052c:	c7 c1 a0 31 10 00    	mov    $0x1031a0,%ecx
  100532:	89 c6                	mov    %eax,%esi
  100534:	29 ce                	sub    %ecx,%esi
  100536:	c1 fe 05             	sar    $0x5,%esi
  100539:	8d 14 f6             	lea    (%esi,%esi,8),%edx
  10053c:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  10053f:	01 d2                	add    %edx,%edx
  100541:	01 f2                	add    %esi,%edx
  100543:	c1 e2 04             	shl    $0x4,%edx
  100546:	29 f2                	sub    %esi,%edx
  100548:	8d 34 d6             	lea    (%esi,%edx,8),%esi
  10054b:	8d 14 b5 00 00 00 00 	lea    0x0(,%esi,4),%edx
  100552:	29 f2                	sub    %esi,%edx
  100554:	89 d6                	mov    %edx,%esi
  100556:	c1 e6 0b             	shl    $0xb,%esi
  100559:	8d b4 32 00 02 00 00 	lea    0x200(%edx,%esi,1),%esi
  100560:	c1 e6 0c             	shl    $0xc,%esi
  100563:	c7 c7 a0 b1 31 00    	mov    $0x31b1a0,%edi
  100569:	8b 07                	mov    (%edi),%eax
  10056b:	29 c8                	sub    %ecx,%eax
  10056d:	89 c1                	mov    %eax,%ecx
  10056f:	c1 f9 05             	sar    $0x5,%ecx
  100572:	8d 14 c9             	lea    (%ecx,%ecx,8),%edx
  100575:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100578:	01 d2                	add    %edx,%edx
  10057a:	01 ca                	add    %ecx,%edx
  10057c:	c1 e2 04             	shl    $0x4,%edx
  10057f:	29 ca                	sub    %ecx,%edx
  100581:	8d 0c d1             	lea    (%ecx,%edx,8),%ecx
  100584:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
  10058b:	29 ca                	sub    %ecx,%edx
  10058d:	89 d1                	mov    %edx,%ecx
  10058f:	c1 e1 0b             	shl    $0xb,%ecx
  100592:	8d 8c 0a 00 02 00 00 	lea    0x200(%edx,%ecx,1),%ecx
  100599:	c1 e1 0c             	shl    $0xc,%ecx
  10059c:	31 d2                	xor    %edx,%edx
  10059e:	66 90                	xchg   %ax,%ax
  1005a0:	8a 04 0a             	mov    (%edx,%ecx,1),%al
  1005a3:	88 04 32             	mov    %al,(%edx,%esi,1)
  1005a6:	42                   	inc    %edx
  1005a7:	81 fa 00 10 00 00    	cmp    $0x1000,%edx
  1005ad:	75 f1                	jne    1005a0 <sys_fork+0x90>
  1005af:	8b 0f                	mov    (%edi),%ecx
  1005b1:	31 d2                	xor    %edx,%edx
  1005b3:	90                   	nop
  1005b4:	8a 04 11             	mov    (%ecx,%edx,1),%al
  1005b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  1005ba:	88 04 17             	mov    %al,(%edi,%edx,1)
  1005bd:	42                   	inc    %edx
  1005be:	81 fa 00 08 00 00    	cmp    $0x800,%edx
  1005c4:	75 ee                	jne    1005b4 <sys_fork+0xa4>
  1005c6:	c7 87 2c 08 00 00 00 	movl   $0x0,0x82c(%edi)
  1005cd:	00 00 00 
  1005d0:	8b 87 58 08 00 00    	mov    0x858(%edi),%eax
  1005d6:	89 81 2c 08 00 00    	mov    %eax,0x82c(%ecx)
  1005dc:	e8 a3 05 00 00       	call   100b84 <schedule>
  1005e1:	83 c4 1c             	add    $0x1c,%esp
  1005e4:	5b                   	pop    %ebx
  1005e5:	5e                   	pop    %esi
  1005e6:	5f                   	pop    %edi
  1005e7:	5d                   	pop    %ebp
  1005e8:	c3                   	ret    
  1005e9:	8d 76 00             	lea    0x0(%esi),%esi

001005ec <sys_sleep>:
  1005ec:	55                   	push   %ebp
  1005ed:	89 e5                	mov    %esp,%ebp
  1005ef:	53                   	push   %ebx
  1005f0:	50                   	push   %eax
  1005f1:	e8 e2 fd ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  1005f6:	81 c3 0a 2a 00 00    	add    $0x2a0a,%ebx
  1005fc:	c7 c0 a0 b1 31 00    	mov    $0x31b1a0,%eax
  100602:	8b 00                	mov    (%eax),%eax
  100604:	c7 80 4c 08 00 00 02 	movl   $0x2,0x84c(%eax)
  10060b:	00 00 00 
  10060e:	8b 55 08             	mov    0x8(%ebp),%edx
  100611:	8b 52 20             	mov    0x20(%edx),%edx
  100614:	89 90 54 08 00 00    	mov    %edx,0x854(%eax)
  10061a:	e8 65 05 00 00       	call   100b84 <schedule>
  10061f:	5a                   	pop    %edx
  100620:	5b                   	pop    %ebx
  100621:	5d                   	pop    %ebp
  100622:	c3                   	ret    
  100623:	90                   	nop

00100624 <syscallHandle>:
  100624:	55                   	push   %ebp
  100625:	89 e5                	mov    %esp,%ebp
  100627:	53                   	push   %ebx
  100628:	50                   	push   %eax
  100629:	e8 aa fd ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  10062e:	81 c3 d2 29 00 00    	add    $0x29d2,%ebx
  100634:	8b 55 08             	mov    0x8(%ebp),%edx
  100637:	8b 42 2c             	mov    0x2c(%edx),%eax
  10063a:	83 f8 02             	cmp    $0x2,%eax
  10063d:	0f 84 91 00 00 00    	je     1006d4 <syscallHandle+0xb0>
  100643:	76 3f                	jbe    100684 <syscallHandle+0x60>
  100645:	83 f8 04             	cmp    $0x4,%eax
  100648:	74 2e                	je     100678 <syscallHandle+0x54>
  10064a:	3d a2 00 00 00       	cmp    $0xa2,%eax
  10064f:	75 67                	jne    1006b8 <syscallHandle+0x94>
  100651:	c7 c0 a0 b1 31 00    	mov    $0x31b1a0,%eax
  100657:	8b 00                	mov    (%eax),%eax
  100659:	c7 80 4c 08 00 00 02 	movl   $0x2,0x84c(%eax)
  100660:	00 00 00 
  100663:	8b 52 20             	mov    0x20(%edx),%edx
  100666:	89 90 54 08 00 00    	mov    %edx,0x854(%eax)
  10066c:	e8 13 05 00 00       	call   100b84 <schedule>
  100671:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100674:	c9                   	leave  
  100675:	c3                   	ret    
  100676:	66 90                	xchg   %ax,%ax
  100678:	89 55 08             	mov    %edx,0x8(%ebp)
  10067b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10067e:	c9                   	leave  
  10067f:	e9 58 fd ff ff       	jmp    1003dc <sys_write>
  100684:	48                   	dec    %eax
  100685:	75 31                	jne    1006b8 <syscallHandle+0x94>
  100687:	c7 c0 a0 b1 31 00    	mov    $0x31b1a0,%eax
  10068d:	8b 10                	mov    (%eax),%edx
  10068f:	c7 82 4c 08 00 00 03 	movl   $0x3,0x84c(%edx)
  100696:	00 00 00 
  100699:	c7 c1 80 31 10 00    	mov    $0x103180,%ecx
  10069f:	8b 09                	mov    (%ecx),%ecx
  1006a1:	89 91 5c 08 00 00    	mov    %edx,0x85c(%ecx)
  1006a7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1006ad:	e8 d2 04 00 00       	call   100b84 <schedule>
  1006b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006b5:	c9                   	leave  
  1006b6:	c3                   	ret    
  1006b7:	90                   	nop
  1006b8:	83 ec 08             	sub    $0x8,%esp
  1006bb:	68 86 00 00 00       	push   $0x86
  1006c0:	8d 83 d8 e0 ff ff    	lea    -0x1f28(%ebx),%eax
  1006c6:	50                   	push   %eax
  1006c7:	e8 ac 08 00 00       	call   100f78 <abort>
  1006cc:	83 c4 10             	add    $0x10,%esp
  1006cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006d2:	c9                   	leave  
  1006d3:	c3                   	ret    
  1006d4:	89 55 08             	mov    %edx,0x8(%ebp)
  1006d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006da:	c9                   	leave  
  1006db:	e9 30 fe ff ff       	jmp    100510 <sys_fork>

001006e0 <GProtectFaultHandle>:
  1006e0:	55                   	push   %ebp
  1006e1:	89 e5                	mov    %esp,%ebp
  1006e3:	53                   	push   %ebx
  1006e4:	83 ec 0c             	sub    $0xc,%esp
  1006e7:	e8 ec fc ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  1006ec:	81 c3 14 29 00 00    	add    $0x2914,%ebx
  1006f2:	68 8c 00 00 00       	push   $0x8c
  1006f7:	8d 83 d8 e0 ff ff    	lea    -0x1f28(%ebx),%eax
  1006fd:	50                   	push   %eax
  1006fe:	e8 75 08 00 00       	call   100f78 <abort>
  100703:	83 c4 10             	add    $0x10,%esp
  100706:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100709:	c9                   	leave  
  10070a:	c3                   	ret    
  10070b:	90                   	nop

0010070c <timerInterruptHandle>:
  10070c:	55                   	push   %ebp
  10070d:	89 e5                	mov    %esp,%ebp
  10070f:	53                   	push   %ebx
  100710:	50                   	push   %eax
  100711:	e8 c2 fc ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  100716:	81 c3 ea 28 00 00    	add    $0x28ea,%ebx
  10071c:	c7 c0 84 31 10 00    	mov    $0x103184,%eax
  100722:	8b 00                	mov    (%eax),%eax
  100724:	85 c0                	test   %eax,%eax
  100726:	74 29                	je     100751 <timerInterruptHandle+0x45>
  100728:	8b 90 54 08 00 00    	mov    0x854(%eax),%edx
  10072e:	85 d2                	test   %edx,%edx
  100730:	7e 15                	jle    100747 <timerInterruptHandle+0x3b>
  100732:	4a                   	dec    %edx
  100733:	89 90 54 08 00 00    	mov    %edx,0x854(%eax)
  100739:	85 d2                	test   %edx,%edx
  10073b:	75 0a                	jne    100747 <timerInterruptHandle+0x3b>
  10073d:	c7 80 4c 08 00 00 01 	movl   $0x1,0x84c(%eax)
  100744:	00 00 00 
  100747:	8b 80 5c 08 00 00    	mov    0x85c(%eax),%eax
  10074d:	85 c0                	test   %eax,%eax
  10074f:	75 d7                	jne    100728 <timerInterruptHandle+0x1c>
  100751:	c7 c0 a0 b1 31 00    	mov    $0x31b1a0,%eax
  100757:	8b 10                	mov    (%eax),%edx
  100759:	85 d2                	test   %edx,%edx
  10075b:	74 33                	je     100790 <timerInterruptHandle+0x84>
  10075d:	ff 8a 50 08 00 00    	decl   0x850(%edx)
  100763:	75 26                	jne    10078b <timerInterruptHandle+0x7f>
  100765:	c7 82 4c 08 00 00 01 	movl   $0x1,0x84c(%edx)
  10076c:	00 00 00 
  10076f:	c7 82 50 08 00 00 0a 	movl   $0xa,0x850(%edx)
  100776:	00 00 00 
  100779:	83 ec 0c             	sub    $0xc,%esp
  10077c:	6a 78                	push   $0x78
  10077e:	e8 b5 07 00 00       	call   100f38 <putChar>
  100783:	e8 fc 03 00 00       	call   100b84 <schedule>
  100788:	83 c4 10             	add    $0x10,%esp
  10078b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10078e:	c9                   	leave  
  10078f:	c3                   	ret    
  100790:	e8 ef 03 00 00       	call   100b84 <schedule>
  100795:	eb f4                	jmp    10078b <timerInterruptHandle+0x7f>
  100797:	90                   	nop

00100798 <irqHandle>:
  100798:	55                   	push   %ebp
  100799:	89 e5                	mov    %esp,%ebp
  10079b:	56                   	push   %esi
  10079c:	53                   	push   %ebx
  10079d:	83 ec 14             	sub    $0x14,%esp
  1007a0:	e8 33 fc ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  1007a5:	81 c3 5b 28 00 00    	add    $0x285b,%ebx
  1007ab:	8b 75 08             	mov    0x8(%ebp),%esi
  1007ae:	b8 10 00 00 00       	mov    $0x10,%eax
  1007b3:	89 c0                	mov    %eax,%eax
  1007b5:	8e d8                	mov    %eax,%ds
  1007b7:	8e e0                	mov    %eax,%fs
  1007b9:	8e c0                	mov    %eax,%es
  1007bb:	b8 30 00 00 00       	mov    $0x30,%eax
  1007c0:	89 c0                	mov    %eax,%eax
  1007c2:	8e e8                	mov    %eax,%gs
  1007c4:	8b 46 30             	mov    0x30(%esi),%eax
  1007c7:	c1 e8 04             	shr    $0x4,%eax
  1007ca:	83 c0 30             	add    $0x30,%eax
  1007cd:	0f be c0             	movsbl %al,%eax
  1007d0:	50                   	push   %eax
  1007d1:	6a 21                	push   $0x21
  1007d3:	ff b3 48 01 00 00    	pushl  0x148(%ebx)
  1007d9:	e8 76 07 00 00       	call   100f54 <video_print>
  1007de:	83 c4 0c             	add    $0xc,%esp
  1007e1:	8b 46 30             	mov    0x30(%esi),%eax
  1007e4:	83 e0 0f             	and    $0xf,%eax
  1007e7:	83 c0 30             	add    $0x30,%eax
  1007ea:	50                   	push   %eax
  1007eb:	6a 22                	push   $0x22
  1007ed:	ff b3 48 01 00 00    	pushl  0x148(%ebx)
  1007f3:	e8 5c 07 00 00       	call   100f54 <video_print>
  1007f8:	8a 46 30             	mov    0x30(%esi),%al
  1007fb:	83 c0 30             	add    $0x30,%eax
  1007fe:	0f be c0             	movsbl %al,%eax
  100801:	89 04 24             	mov    %eax,(%esp)
  100804:	e8 2f 07 00 00       	call   100f38 <putChar>
  100809:	8b 83 48 01 00 00    	mov    0x148(%ebx),%eax
  10080f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100812:	40                   	inc    %eax
  100813:	b9 14 00 00 00       	mov    $0x14,%ecx
  100818:	99                   	cltd   
  100819:	f7 f9                	idiv   %ecx
  10081b:	89 93 48 01 00 00    	mov    %edx,0x148(%ebx)
  100821:	83 c4 10             	add    $0x10,%esp
  100824:	8b 46 30             	mov    0x30(%esi),%eax
  100827:	83 f8 20             	cmp    $0x20,%eax
  10082a:	74 64                	je     100890 <irqHandle+0xf8>
  10082c:	76 22                	jbe    100850 <irqHandle+0xb8>
  10082e:	3d 80 00 00 00       	cmp    $0x80,%eax
  100833:	74 0b                	je     100840 <irqHandle+0xa8>
  100835:	40                   	inc    %eax
  100836:	75 3c                	jne    100874 <irqHandle+0xdc>
  100838:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10083b:	5b                   	pop    %ebx
  10083c:	5e                   	pop    %esi
  10083d:	5d                   	pop    %ebp
  10083e:	c3                   	ret    
  10083f:	90                   	nop
  100840:	89 75 08             	mov    %esi,0x8(%ebp)
  100843:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100846:	5b                   	pop    %ebx
  100847:	5e                   	pop    %esi
  100848:	5d                   	pop    %ebp
  100849:	e9 d6 fd ff ff       	jmp    100624 <syscallHandle>
  10084e:	66 90                	xchg   %ax,%ax
  100850:	83 f8 0d             	cmp    $0xd,%eax
  100853:	75 1f                	jne    100874 <irqHandle+0xdc>
  100855:	83 ec 08             	sub    $0x8,%esp
  100858:	68 8c 00 00 00       	push   $0x8c
  10085d:	8d 83 d8 e0 ff ff    	lea    -0x1f28(%ebx),%eax
  100863:	50                   	push   %eax
  100864:	e8 0f 07 00 00       	call   100f78 <abort>
  100869:	83 c4 10             	add    $0x10,%esp
  10086c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10086f:	5b                   	pop    %ebx
  100870:	5e                   	pop    %esi
  100871:	5d                   	pop    %ebp
  100872:	c3                   	ret    
  100873:	90                   	nop
  100874:	83 ec 08             	sub    $0x8,%esp
  100877:	6a 38                	push   $0x38
  100879:	8d 83 d8 e0 ff ff    	lea    -0x1f28(%ebx),%eax
  10087f:	50                   	push   %eax
  100880:	e8 f3 06 00 00       	call   100f78 <abort>
  100885:	83 c4 10             	add    $0x10,%esp
  100888:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10088b:	5b                   	pop    %ebx
  10088c:	5e                   	pop    %esi
  10088d:	5d                   	pop    %ebp
  10088e:	c3                   	ret    
  10088f:	90                   	nop
  100890:	89 75 08             	mov    %esi,0x8(%ebp)
  100893:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100896:	5b                   	pop    %ebx
  100897:	5e                   	pop    %esi
  100898:	5d                   	pop    %ebp
  100899:	e9 6e fe ff ff       	jmp    10070c <timerInterruptHandle>
  10089e:	66 90                	xchg   %ax,%ax

001008a0 <waitDisk>:
  1008a0:	55                   	push   %ebp
  1008a1:	89 e5                	mov    %esp,%ebp
  1008a3:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1008a8:	ec                   	in     (%dx),%al
  1008a9:	83 e0 c0             	and    $0xffffffc0,%eax
  1008ac:	3c 40                	cmp    $0x40,%al
  1008ae:	75 f8                	jne    1008a8 <waitDisk+0x8>
  1008b0:	5d                   	pop    %ebp
  1008b1:	c3                   	ret    
  1008b2:	66 90                	xchg   %ax,%ax

001008b4 <readSect>:
  1008b4:	55                   	push   %ebp
  1008b5:	89 e5                	mov    %esp,%ebp
  1008b7:	53                   	push   %ebx
  1008b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1008bb:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1008c0:	ec                   	in     (%dx),%al
  1008c1:	83 e0 c0             	and    $0xffffffc0,%eax
  1008c4:	3c 40                	cmp    $0x40,%al
  1008c6:	75 f8                	jne    1008c0 <readSect+0xc>
  1008c8:	ba f2 01 00 00       	mov    $0x1f2,%edx
  1008cd:	b0 01                	mov    $0x1,%al
  1008cf:	ee                   	out    %al,(%dx)
  1008d0:	ba f3 01 00 00       	mov    $0x1f3,%edx
  1008d5:	88 c8                	mov    %cl,%al
  1008d7:	ee                   	out    %al,(%dx)
  1008d8:	89 c8                	mov    %ecx,%eax
  1008da:	c1 f8 08             	sar    $0x8,%eax
  1008dd:	ba f4 01 00 00       	mov    $0x1f4,%edx
  1008e2:	ee                   	out    %al,(%dx)
  1008e3:	89 c8                	mov    %ecx,%eax
  1008e5:	c1 f8 10             	sar    $0x10,%eax
  1008e8:	ba f5 01 00 00       	mov    $0x1f5,%edx
  1008ed:	ee                   	out    %al,(%dx)
  1008ee:	89 c8                	mov    %ecx,%eax
  1008f0:	c1 f8 18             	sar    $0x18,%eax
  1008f3:	83 c8 e0             	or     $0xffffffe0,%eax
  1008f6:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1008fb:	ee                   	out    %al,(%dx)
  1008fc:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100901:	b0 20                	mov    $0x20,%al
  100903:	ee                   	out    %al,(%dx)
  100904:	ec                   	in     (%dx),%al
  100905:	83 e0 c0             	and    $0xffffffc0,%eax
  100908:	3c 40                	cmp    $0x40,%al
  10090a:	75 f8                	jne    100904 <readSect+0x50>
  10090c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10090f:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100915:	ba f0 01 00 00       	mov    $0x1f0,%edx
  10091a:	66 90                	xchg   %ax,%ax
  10091c:	ed                   	in     (%dx),%eax
  10091d:	89 01                	mov    %eax,(%ecx)
  10091f:	83 c1 04             	add    $0x4,%ecx
  100922:	39 d9                	cmp    %ebx,%ecx
  100924:	75 f6                	jne    10091c <readSect+0x68>
  100926:	5b                   	pop    %ebx
  100927:	5d                   	pop    %ebp
  100928:	c3                   	ret    
  100929:	8d 76 00             	lea    0x0(%esi),%esi

0010092c <initSeg>:
  10092c:	55                   	push   %ebp
  10092d:	89 e5                	mov    %esp,%ebp
  10092f:	56                   	push   %esi
  100930:	53                   	push   %ebx
  100931:	e8 3d 02 00 00       	call   100b73 <__x86.get_pc_thunk.si>
  100936:	81 c6 ca 26 00 00    	add    $0x26ca,%esi
  10093c:	c7 c1 c0 b9 31 00    	mov    $0x31b9c0,%ecx
  100942:	66 c7 41 08 ff ff    	movw   $0xffff,0x8(%ecx)
  100948:	66 c7 41 0a 00 00    	movw   $0x0,0xa(%ecx)
  10094e:	c6 41 0c 00          	movb   $0x0,0xc(%ecx)
  100952:	8a 41 0d             	mov    0xd(%ecx),%al
  100955:	83 e0 f0             	and    $0xfffffff0,%eax
  100958:	83 c8 1a             	or     $0x1a,%eax
  10095b:	83 e0 9f             	and    $0xffffff9f,%eax
  10095e:	83 c8 80             	or     $0xffffff80,%eax
  100961:	88 41 0d             	mov    %al,0xd(%ecx)
  100964:	8a 41 0e             	mov    0xe(%ecx),%al
  100967:	83 c8 0f             	or     $0xf,%eax
  10096a:	83 e0 cf             	and    $0xffffffcf,%eax
  10096d:	83 c8 c0             	or     $0xffffffc0,%eax
  100970:	88 41 0e             	mov    %al,0xe(%ecx)
  100973:	c6 41 0f 00          	movb   $0x0,0xf(%ecx)
  100977:	66 c7 41 10 ff ff    	movw   $0xffff,0x10(%ecx)
  10097d:	66 c7 41 12 00 00    	movw   $0x0,0x12(%ecx)
  100983:	c6 41 14 00          	movb   $0x0,0x14(%ecx)
  100987:	8a 41 15             	mov    0x15(%ecx),%al
  10098a:	83 e0 f0             	and    $0xfffffff0,%eax
  10098d:	83 c8 12             	or     $0x12,%eax
  100990:	83 e0 9f             	and    $0xffffff9f,%eax
  100993:	83 c8 80             	or     $0xffffff80,%eax
  100996:	88 41 15             	mov    %al,0x15(%ecx)
  100999:	8a 41 16             	mov    0x16(%ecx),%al
  10099c:	83 c8 0f             	or     $0xf,%eax
  10099f:	83 e0 cf             	and    $0xffffffcf,%eax
  1009a2:	83 c8 c0             	or     $0xffffffc0,%eax
  1009a5:	88 41 16             	mov    %al,0x16(%ecx)
  1009a8:	c6 41 17 00          	movb   $0x0,0x17(%ecx)
  1009ac:	66 c7 41 18 ff ff    	movw   $0xffff,0x18(%ecx)
  1009b2:	66 c7 41 1a 00 00    	movw   $0x0,0x1a(%ecx)
  1009b8:	c6 41 1c 00          	movb   $0x0,0x1c(%ecx)
  1009bc:	c6 41 1d fa          	movb   $0xfa,0x1d(%ecx)
  1009c0:	8a 41 1e             	mov    0x1e(%ecx),%al
  1009c3:	83 c8 0f             	or     $0xf,%eax
  1009c6:	83 e0 cf             	and    $0xffffffcf,%eax
  1009c9:	83 c8 c0             	or     $0xffffffc0,%eax
  1009cc:	88 41 1e             	mov    %al,0x1e(%ecx)
  1009cf:	c6 41 1f 00          	movb   $0x0,0x1f(%ecx)
  1009d3:	66 c7 41 20 ff ff    	movw   $0xffff,0x20(%ecx)
  1009d9:	66 c7 41 22 00 00    	movw   $0x0,0x22(%ecx)
  1009df:	c6 41 24 00          	movb   $0x0,0x24(%ecx)
  1009e3:	c6 41 25 f2          	movb   $0xf2,0x25(%ecx)
  1009e7:	8a 41 26             	mov    0x26(%ecx),%al
  1009ea:	83 c8 0f             	or     $0xf,%eax
  1009ed:	83 e0 cf             	and    $0xffffffcf,%eax
  1009f0:	83 c8 c0             	or     $0xffffffc0,%eax
  1009f3:	88 41 26             	mov    %al,0x26(%ecx)
  1009f6:	c6 41 27 00          	movb   $0x0,0x27(%ecx)
  1009fa:	66 c7 41 28 63 00    	movw   $0x63,0x28(%ecx)
  100a00:	c7 c3 00 ba 31 00    	mov    $0x31ba00,%ebx
  100a06:	66 89 59 2a          	mov    %bx,0x2a(%ecx)
  100a0a:	89 d8                	mov    %ebx,%eax
  100a0c:	c1 e8 10             	shr    $0x10,%eax
  100a0f:	88 41 2c             	mov    %al,0x2c(%ecx)
  100a12:	8a 41 2d             	mov    0x2d(%ecx),%al
  100a15:	83 e0 f0             	and    $0xfffffff0,%eax
  100a18:	83 c8 09             	or     $0x9,%eax
  100a1b:	83 e0 8f             	and    $0xffffff8f,%eax
  100a1e:	83 c8 80             	or     $0xffffff80,%eax
  100a21:	88 41 2d             	mov    %al,0x2d(%ecx)
  100a24:	8a 41 2e             	mov    0x2e(%ecx),%al
  100a27:	83 e0 c0             	and    $0xffffffc0,%eax
  100a2a:	83 c8 40             	or     $0x40,%eax
  100a2d:	83 e0 7f             	and    $0x7f,%eax
  100a30:	88 41 2e             	mov    %al,0x2e(%ecx)
  100a33:	89 d8                	mov    %ebx,%eax
  100a35:	c1 e8 18             	shr    $0x18,%eax
  100a38:	88 41 2f             	mov    %al,0x2f(%ecx)
  100a3b:	8b 86 ec e0 ff ff    	mov    -0x1f14(%esi),%eax
  100a41:	8b 96 f0 e0 ff ff    	mov    -0x1f10(%esi),%edx
  100a47:	89 41 30             	mov    %eax,0x30(%ecx)
  100a4a:	89 51 34             	mov    %edx,0x34(%ecx)
  100a4d:	66 c7 86 50 01 00 00 	movw   $0x37,0x150(%esi)
  100a54:	37 00 
  100a56:	66 89 8e 52 01 00 00 	mov    %cx,0x152(%esi)
  100a5d:	c1 e9 10             	shr    $0x10,%ecx
  100a60:	66 89 8e 54 01 00 00 	mov    %cx,0x154(%esi)
  100a67:	8d 86 50 01 00 00    	lea    0x150(%esi),%eax
  100a6d:	0f 01 10             	lgdtl  (%eax)
  100a70:	b8 28 00 00 00       	mov    $0x28,%eax
  100a75:	0f 00 d8             	ltr    %ax
  100a78:	c7 43 08 10 00 00 00 	movl   $0x10,0x8(%ebx)
  100a7f:	c7 43 04 00 00 20 00 	movl   $0x200000,0x4(%ebx)
  100a86:	31 c0                	xor    %eax,%eax
  100a88:	0f 00 d0             	lldt   %ax
  100a8b:	5b                   	pop    %ebx
  100a8c:	5e                   	pop    %esi
  100a8d:	5d                   	pop    %ebp
  100a8e:	c3                   	ret    
  100a8f:	90                   	nop

00100a90 <enterUserSpace>:
  100a90:	55                   	push   %ebp
  100a91:	89 e5                	mov    %esp,%ebp
  100a93:	b8 23 00 00 00       	mov    $0x23,%eax
  100a98:	50                   	push   %eax
  100a99:	68 00 00 00 08       	push   $0x8000000
  100a9e:	9c                   	pushf  
  100a9f:	b8 1b 00 00 00       	mov    $0x1b,%eax
  100aa4:	50                   	push   %eax
  100aa5:	8b 45 08             	mov    0x8(%ebp),%eax
  100aa8:	50                   	push   %eax
  100aa9:	cf                   	iret   
  100aaa:	5d                   	pop    %ebp
  100aab:	c3                   	ret    

00100aac <loader>:
  100aac:	55                   	push   %ebp
  100aad:	89 e5                	mov    %esp,%ebp
  100aaf:	57                   	push   %edi
  100ab0:	56                   	push   %esi
  100ab1:	53                   	push   %ebx
  100ab2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ab5:	8b 43 1c             	mov    0x1c(%ebx),%eax
  100ab8:	01 d8                	add    %ebx,%eax
  100aba:	0f b7 73 2c          	movzwl 0x2c(%ebx),%esi
  100abe:	c1 e6 05             	shl    $0x5,%esi
  100ac1:	01 c6                	add    %eax,%esi
  100ac3:	39 f0                	cmp    %esi,%eax
  100ac5:	72 0c                	jb     100ad3 <loader+0x27>
  100ac7:	eb 4b                	jmp    100b14 <loader+0x68>
  100ac9:	8d 76 00             	lea    0x0(%esi),%esi
  100acc:	83 c0 20             	add    $0x20,%eax
  100acf:	39 c6                	cmp    %eax,%esi
  100ad1:	76 41                	jbe    100b14 <loader+0x68>
  100ad3:	83 38 01             	cmpl   $0x1,(%eax)
  100ad6:	75 f4                	jne    100acc <loader+0x20>
  100ad8:	8b 48 10             	mov    0x10(%eax),%ecx
  100adb:	85 c9                	test   %ecx,%ecx
  100add:	74 1b                	je     100afa <loader+0x4e>
  100adf:	31 d2                	xor    %edx,%edx
  100ae1:	8d 76 00             	lea    0x0(%esi),%esi
  100ae4:	8d 0c 13             	lea    (%ebx,%edx,1),%ecx
  100ae7:	03 48 04             	add    0x4(%eax),%ecx
  100aea:	8a 09                	mov    (%ecx),%cl
  100aec:	8b 78 08             	mov    0x8(%eax),%edi
  100aef:	88 0c 17             	mov    %cl,(%edi,%edx,1)
  100af2:	42                   	inc    %edx
  100af3:	8b 48 10             	mov    0x10(%eax),%ecx
  100af6:	39 d1                	cmp    %edx,%ecx
  100af8:	77 ea                	ja     100ae4 <loader+0x38>
  100afa:	39 48 14             	cmp    %ecx,0x14(%eax)
  100afd:	76 cd                	jbe    100acc <loader+0x20>
  100aff:	90                   	nop
  100b00:	8b 50 08             	mov    0x8(%eax),%edx
  100b03:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
  100b07:	41                   	inc    %ecx
  100b08:	39 48 14             	cmp    %ecx,0x14(%eax)
  100b0b:	77 f3                	ja     100b00 <loader+0x54>
  100b0d:	83 c0 20             	add    $0x20,%eax
  100b10:	39 c6                	cmp    %eax,%esi
  100b12:	77 bf                	ja     100ad3 <loader+0x27>
  100b14:	8b 43 18             	mov    0x18(%ebx),%eax
  100b17:	5b                   	pop    %ebx
  100b18:	5e                   	pop    %esi
  100b19:	5f                   	pop    %edi
  100b1a:	5d                   	pop    %ebp
  100b1b:	c3                   	ret    

00100b1c <loadUMain>:
  100b1c:	55                   	push   %ebp
  100b1d:	89 e5                	mov    %esp,%ebp
  100b1f:	57                   	push   %edi
  100b20:	56                   	push   %esi
  100b21:	53                   	push   %ebx
  100b22:	83 ec 0c             	sub    $0xc,%esp
  100b25:	e8 ae f8 ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  100b2a:	81 c3 d6 24 00 00    	add    $0x24d6,%ebx
  100b30:	be c9 00 00 00       	mov    $0xc9,%esi
  100b35:	bf 00 00 60 00       	mov    $0x600000,%edi
  100b3a:	66 90                	xchg   %ax,%ax
  100b3c:	56                   	push   %esi
  100b3d:	57                   	push   %edi
  100b3e:	e8 71 fd ff ff       	call   1008b4 <readSect>
  100b43:	81 c7 00 02 00 00    	add    $0x200,%edi
  100b49:	46                   	inc    %esi
  100b4a:	58                   	pop    %eax
  100b4b:	5a                   	pop    %edx
  100b4c:	81 fe 2d 01 00 00    	cmp    $0x12d,%esi
  100b52:	75 e8                	jne    100b3c <loadUMain+0x20>
  100b54:	68 00 00 60 00       	push   $0x600000
  100b59:	e8 4e ff ff ff       	call   100aac <loader>
  100b5e:	fb                   	sti    
  100b5f:	83 ec 08             	sub    $0x8,%esp
  100b62:	50                   	push   %eax
  100b63:	e8 f8 02 00 00       	call   100e60 <enter_proc>
  100b68:	83 c4 10             	add    $0x10,%esp
  100b6b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100b6e:	5b                   	pop    %ebx
  100b6f:	5e                   	pop    %esi
  100b70:	5f                   	pop    %edi
  100b71:	5d                   	pop    %ebp
  100b72:	c3                   	ret    

00100b73 <__x86.get_pc_thunk.si>:
  100b73:	8b 34 24             	mov    (%esp),%esi
  100b76:	c3                   	ret    
  100b77:	90                   	nop

00100b78 <idle>:
  100b78:	55                   	push   %ebp
  100b79:	89 e5                	mov    %esp,%ebp
  100b7b:	bc 00 00 20 00       	mov    $0x200000,%esp
  100b80:	fb                   	sti    
  100b81:	f4                   	hlt    
  100b82:	5d                   	pop    %ebp
  100b83:	c3                   	ret    

00100b84 <schedule>:
  100b84:	55                   	push   %ebp
  100b85:	89 e5                	mov    %esp,%ebp
  100b87:	57                   	push   %edi
  100b88:	56                   	push   %esi
  100b89:	53                   	push   %ebx
  100b8a:	83 ec 1c             	sub    $0x1c,%esp
  100b8d:	e8 46 f8 ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  100b92:	81 c3 6e 24 00 00    	add    $0x246e,%ebx
  100b98:	c7 c6 a0 b1 31 00    	mov    $0x31b1a0,%esi
  100b9e:	8b 3e                	mov    (%esi),%edi
  100ba0:	85 ff                	test   %edi,%edi
  100ba2:	0f 84 4c 01 00 00    	je     100cf4 <schedule+0x170>
  100ba8:	8b 87 5c 08 00 00    	mov    0x85c(%edi),%eax
  100bae:	85 c0                	test   %eax,%eax
  100bb0:	0f 84 3e 01 00 00    	je     100cf4 <schedule+0x170>
  100bb6:	c7 87 5c 08 00 00 00 	movl   $0x0,0x85c(%edi)
  100bbd:	00 00 00 
  100bc0:	c7 c2 84 31 10 00    	mov    $0x103184,%edx
  100bc6:	89 02                	mov    %eax,(%edx)
  100bc8:	89 c1                	mov    %eax,%ecx
  100bca:	eb 02                	jmp    100bce <schedule+0x4a>
  100bcc:	89 d1                	mov    %edx,%ecx
  100bce:	8b 91 5c 08 00 00    	mov    0x85c(%ecx),%edx
  100bd4:	85 d2                	test   %edx,%edx
  100bd6:	75 f4                	jne    100bcc <schedule+0x48>
  100bd8:	89 b9 5c 08 00 00    	mov    %edi,0x85c(%ecx)
  100bde:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  100be4:	eb 10                	jmp    100bf6 <schedule+0x72>
  100be6:	66 90                	xchg   %ax,%ax
  100be8:	8b 80 5c 08 00 00    	mov    0x85c(%eax),%eax
  100bee:	85 c0                	test   %eax,%eax
  100bf0:	0f 84 14 01 00 00    	je     100d0a <schedule+0x186>
  100bf6:	83 b8 4c 08 00 00 01 	cmpl   $0x1,0x84c(%eax)
  100bfd:	75 e9                	jne    100be8 <schedule+0x64>
  100bff:	c7 80 4c 08 00 00 00 	movl   $0x0,0x84c(%eax)
  100c06:	00 00 00 
  100c09:	89 06                	mov    %eax,(%esi)
  100c0b:	83 ec 0c             	sub    $0xc,%esp
  100c0e:	8b 80 58 08 00 00    	mov    0x858(%eax),%eax
  100c14:	83 c0 20             	add    $0x20,%eax
  100c17:	0f be c0             	movsbl %al,%eax
  100c1a:	50                   	push   %eax
  100c1b:	e8 18 03 00 00       	call   100f38 <putChar>
  100c20:	8b 06                	mov    (%esi),%eax
  100c22:	8d 88 00 08 00 00    	lea    0x800(%eax),%ecx
  100c28:	c7 c2 00 ba 31 00    	mov    $0x31ba00,%edx
  100c2e:	89 4a 04             	mov    %ecx,0x4(%edx)
  100c31:	c7 42 08 10 00 00 00 	movl   $0x10,0x8(%edx)
  100c38:	81 e8 a0 31 10 00    	sub    $0x1031a0,%eax
  100c3e:	c1 f8 05             	sar    $0x5,%eax
  100c41:	8d 14 c0             	lea    (%eax,%eax,8),%edx
  100c44:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100c47:	01 d2                	add    %edx,%edx
  100c49:	01 c2                	add    %eax,%edx
  100c4b:	c1 e2 04             	shl    $0x4,%edx
  100c4e:	29 c2                	sub    %eax,%edx
  100c50:	8d 14 d0             	lea    (%eax,%edx,8),%edx
  100c53:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
  100c5a:	29 d0                	sub    %edx,%eax
  100c5c:	89 c2                	mov    %eax,%edx
  100c5e:	c1 e2 0b             	shl    $0xb,%edx
  100c61:	01 d0                	add    %edx,%eax
  100c63:	89 c7                	mov    %eax,%edi
  100c65:	c1 e7 0c             	shl    $0xc,%edi
  100c68:	c1 e0 0c             	shl    $0xc,%eax
  100c6b:	89 c6                	mov    %eax,%esi
  100c6d:	c1 ee 10             	shr    $0x10,%esi
  100c70:	c1 e8 18             	shr    $0x18,%eax
  100c73:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100c76:	c7 c0 c0 b9 31 00    	mov    $0x31b9c0,%eax
  100c7c:	66 c7 40 18 ff ff    	movw   $0xffff,0x18(%eax)
  100c82:	66 89 78 1a          	mov    %di,0x1a(%eax)
  100c86:	89 f3                	mov    %esi,%ebx
  100c88:	88 58 1c             	mov    %bl,0x1c(%eax)
  100c8b:	c6 40 1d fa          	movb   $0xfa,0x1d(%eax)
  100c8f:	8a 50 1e             	mov    0x1e(%eax),%dl
  100c92:	83 ca 0f             	or     $0xf,%edx
  100c95:	83 e2 cf             	and    $0xffffffcf,%edx
  100c98:	83 ca c0             	or     $0xffffffc0,%edx
  100c9b:	88 50 1e             	mov    %dl,0x1e(%eax)
  100c9e:	8a 5d e4             	mov    -0x1c(%ebp),%bl
  100ca1:	88 58 1f             	mov    %bl,0x1f(%eax)
  100ca4:	66 c7 40 20 ff ff    	movw   $0xffff,0x20(%eax)
  100caa:	66 89 78 22          	mov    %di,0x22(%eax)
  100cae:	89 f3                	mov    %esi,%ebx
  100cb0:	88 58 24             	mov    %bl,0x24(%eax)
  100cb3:	c6 40 25 f2          	movb   $0xf2,0x25(%eax)
  100cb7:	8a 50 26             	mov    0x26(%eax),%dl
  100cba:	83 ca 0f             	or     $0xf,%edx
  100cbd:	83 e2 cf             	and    $0xffffffcf,%edx
  100cc0:	83 ca c0             	or     $0xffffffc0,%edx
  100cc3:	88 50 26             	mov    %dl,0x26(%eax)
  100cc6:	8a 5d e4             	mov    -0x1c(%ebp),%bl
  100cc9:	88 58 27             	mov    %bl,0x27(%eax)
  100ccc:	50                   	push   %eax
  100ccd:	b8 23 00 00 00       	mov    $0x23,%eax
  100cd2:	89 c0                	mov    %eax,%eax
  100cd4:	8e d8                	mov    %eax,%ds
  100cd6:	8e c0                	mov    %eax,%es
  100cd8:	58                   	pop    %eax
  100cd9:	89 cc                	mov    %ecx,%esp
  100cdb:	0f a9                	pop    %gs
  100cdd:	0f a1                	pop    %fs
  100cdf:	07                   	pop    %es
  100ce0:	1f                   	pop    %ds
  100ce1:	61                   	popa   
  100ce2:	83 c4 04             	add    $0x4,%esp
  100ce5:	83 c4 04             	add    $0x4,%esp
  100ce8:	cf                   	iret   
  100ce9:	83 c4 10             	add    $0x10,%esp
  100cec:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100cef:	5b                   	pop    %ebx
  100cf0:	5e                   	pop    %esi
  100cf1:	5f                   	pop    %edi
  100cf2:	5d                   	pop    %ebp
  100cf3:	c3                   	ret    
  100cf4:	c7 c0 84 31 10 00    	mov    $0x103184,%eax
  100cfa:	8b 00                	mov    (%eax),%eax
  100cfc:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  100d02:	85 c0                	test   %eax,%eax
  100d04:	0f 85 ec fe ff ff    	jne    100bf6 <schedule+0x72>
  100d0a:	83 ec 0c             	sub    $0xc,%esp
  100d0d:	6a 7e                	push   $0x7e
  100d0f:	e8 24 02 00 00       	call   100f38 <putChar>
  100d14:	bc 00 00 20 00       	mov    $0x200000,%esp
  100d19:	fb                   	sti    
  100d1a:	f4                   	hlt    
  100d1b:	83 c4 10             	add    $0x10,%esp
  100d1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100d21:	5b                   	pop    %ebx
  100d22:	5e                   	pop    %esi
  100d23:	5f                   	pop    %edi
  100d24:	5d                   	pop    %ebp
  100d25:	c3                   	ret    
  100d26:	66 90                	xchg   %ax,%ax

00100d28 <initPCB>:
  100d28:	55                   	push   %ebp
  100d29:	89 e5                	mov    %esp,%ebp
  100d2b:	53                   	push   %ebx
  100d2c:	e8 c0 01 00 00       	call   100ef1 <__x86.get_pc_thunk.cx>
  100d31:	81 c1 cf 22 00 00    	add    $0x22cf,%ecx
  100d37:	c7 c3 a0 31 10 00    	mov    $0x1031a0,%ebx
  100d3d:	8d 83 60 08 00 00    	lea    0x860(%ebx),%eax
  100d43:	8d 93 00 80 21 00    	lea    0x218000(%ebx),%edx
  100d49:	8d 76 00             	lea    0x0(%esi),%esi
  100d4c:	89 40 fc             	mov    %eax,-0x4(%eax)
  100d4f:	05 60 08 00 00       	add    $0x860,%eax
  100d54:	39 d0                	cmp    %edx,%eax
  100d56:	75 f4                	jne    100d4c <initPCB+0x24>
  100d58:	c7 83 fc 7f 21 00 00 	movl   $0x0,0x217ffc(%ebx)
  100d5f:	00 00 00 
  100d62:	c7 c0 84 31 10 00    	mov    $0x103184,%eax
  100d68:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  100d6e:	c7 c0 80 31 10 00    	mov    $0x103180,%eax
  100d74:	89 18                	mov    %ebx,(%eax)
  100d76:	c7 c0 a0 b1 31 00    	mov    $0x31b1a0,%eax
  100d7c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  100d82:	5b                   	pop    %ebx
  100d83:	5d                   	pop    %ebp
  100d84:	c3                   	ret    
  100d85:	8d 76 00             	lea    0x0(%esi),%esi

00100d88 <newPCB>:
  100d88:	55                   	push   %ebp
  100d89:	89 e5                	mov    %esp,%ebp
  100d8b:	56                   	push   %esi
  100d8c:	53                   	push   %ebx
  100d8d:	e8 46 f6 ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  100d92:	81 c3 6e 22 00 00    	add    $0x226e,%ebx
  100d98:	c7 c6 80 31 10 00    	mov    $0x103180,%esi
  100d9e:	8b 06                	mov    (%esi),%eax
  100da0:	85 c0                	test   %eax,%eax
  100da2:	0f 84 9d 00 00 00    	je     100e45 <newPCB+0xbd>
  100da8:	8b 90 5c 08 00 00    	mov    0x85c(%eax),%edx
  100dae:	89 16                	mov    %edx,(%esi)
  100db0:	c7 80 5c 08 00 00 00 	movl   $0x0,0x85c(%eax)
  100db7:	00 00 00 
  100dba:	c7 80 50 08 00 00 0a 	movl   $0xa,0x850(%eax)
  100dc1:	00 00 00 
  100dc4:	c7 80 54 08 00 00 00 	movl   $0x0,0x854(%eax)
  100dcb:	00 00 00 
  100dce:	89 c1                	mov    %eax,%ecx
  100dd0:	81 e9 a0 31 10 00    	sub    $0x1031a0,%ecx
  100dd6:	c1 f9 05             	sar    $0x5,%ecx
  100dd9:	8d 14 c9             	lea    (%ecx,%ecx,8),%edx
  100ddc:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  100ddf:	01 d2                	add    %edx,%edx
  100de1:	01 ca                	add    %ecx,%edx
  100de3:	c1 e2 04             	shl    $0x4,%edx
  100de6:	29 ca                	sub    %ecx,%edx
  100de8:	8d 0c d1             	lea    (%ecx,%edx,8),%ecx
  100deb:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
  100df2:	29 ca                	sub    %ecx,%edx
  100df4:	89 d1                	mov    %edx,%ecx
  100df6:	c1 e1 0b             	shl    $0xb,%ecx
  100df9:	8d 94 0a 10 27 00 00 	lea    0x2710(%edx,%ecx,1),%edx
  100e00:	89 90 58 08 00 00    	mov    %edx,0x858(%eax)
  100e06:	c7 80 4c 08 00 00 01 	movl   $0x1,0x84c(%eax)
  100e0d:	00 00 00 
  100e10:	c7 c2 84 31 10 00    	mov    $0x103184,%edx
  100e16:	8b 0a                	mov    (%edx),%ecx
  100e18:	85 c9                	test   %ecx,%ecx
  100e1a:	75 06                	jne    100e22 <newPCB+0x9a>
  100e1c:	eb 1e                	jmp    100e3c <newPCB+0xb4>
  100e1e:	66 90                	xchg   %ax,%ax
  100e20:	89 d1                	mov    %edx,%ecx
  100e22:	8b 91 5c 08 00 00    	mov    0x85c(%ecx),%edx
  100e28:	85 d2                	test   %edx,%edx
  100e2a:	75 f4                	jne    100e20 <newPCB+0x98>
  100e2c:	89 81 5c 08 00 00    	mov    %eax,0x85c(%ecx)
  100e32:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e35:	5b                   	pop    %ebx
  100e36:	5e                   	pop    %esi
  100e37:	5d                   	pop    %ebp
  100e38:	c3                   	ret    
  100e39:	8d 76 00             	lea    0x0(%esi),%esi
  100e3c:	89 02                	mov    %eax,(%edx)
  100e3e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e41:	5b                   	pop    %ebx
  100e42:	5e                   	pop    %esi
  100e43:	5d                   	pop    %ebp
  100e44:	c3                   	ret    
  100e45:	83 ec 08             	sub    $0x8,%esp
  100e48:	6a 64                	push   $0x64
  100e4a:	8d 83 f4 e0 ff ff    	lea    -0x1f0c(%ebx),%eax
  100e50:	50                   	push   %eax
  100e51:	e8 22 01 00 00       	call   100f78 <abort>
  100e56:	8b 06                	mov    (%esi),%eax
  100e58:	83 c4 10             	add    $0x10,%esp
  100e5b:	e9 48 ff ff ff       	jmp    100da8 <newPCB+0x20>

00100e60 <enter_proc>:
  100e60:	55                   	push   %ebp
  100e61:	89 e5                	mov    %esp,%ebp
  100e63:	53                   	push   %ebx
  100e64:	50                   	push   %eax
  100e65:	e8 6e f5 ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  100e6a:	81 c3 96 21 00 00    	add    $0x2196,%ebx
  100e70:	e8 13 ff ff ff       	call   100d88 <newPCB>
  100e75:	c7 c2 a0 b1 31 00    	mov    $0x31b1a0,%edx
  100e7b:	89 02                	mov    %eax,(%edx)
  100e7d:	ba 23 00 00 00       	mov    $0x23,%edx
  100e82:	89 d0                	mov    %edx,%eax
  100e84:	8e d8                	mov    %eax,%ds
  100e86:	8e c0                	mov    %eax,%es
  100e88:	8e e0                	mov    %eax,%fs
  100e8a:	c7 80 48 08 00 00 23 	movl   $0x23,0x848(%eax)
  100e91:	00 00 00 
  100e94:	c7 80 44 08 00 00 00 	movl   $0x201000,0x844(%eax)
  100e9b:	10 20 00 
  100e9e:	fb                   	sti    
  100e9f:	9c                   	pushf  
  100ea0:	fa                   	cli    
  100ea1:	8b 14 24             	mov    (%esp),%edx
  100ea4:	89 90 40 08 00 00    	mov    %edx,0x840(%eax)
  100eaa:	c7 80 3c 08 00 00 1b 	movl   $0x1b,0x83c(%eax)
  100eb1:	00 00 00 
  100eb4:	8b 55 08             	mov    0x8(%ebp),%edx
  100eb7:	89 90 38 08 00 00    	mov    %edx,0x838(%eax)
  100ebd:	c7 80 4c 08 00 00 00 	movl   $0x0,0x84c(%eax)
  100ec4:	00 00 00 
  100ec7:	c7 80 50 08 00 00 0a 	movl   $0xa,0x850(%eax)
  100ece:	00 00 00 
  100ed1:	c7 80 54 08 00 00 00 	movl   $0x0,0x854(%eax)
  100ed8:	00 00 00 
  100edb:	c7 80 58 08 00 00 00 	movl   $0x200000,0x858(%eax)
  100ee2:	00 20 00 
  100ee5:	05 38 08 00 00       	add    $0x838,%eax
  100eea:	89 c4                	mov    %eax,%esp
  100eec:	cf                   	iret   
  100eed:	5a                   	pop    %edx
  100eee:	5b                   	pop    %ebx
  100eef:	5d                   	pop    %ebp
  100ef0:	c3                   	ret    

00100ef1 <__x86.get_pc_thunk.cx>:
  100ef1:	8b 0c 24             	mov    (%esp),%ecx
  100ef4:	c3                   	ret    
  100ef5:	66 90                	xchg   %ax,%ax
  100ef7:	90                   	nop

00100ef8 <initSerial>:
  100ef8:	55                   	push   %ebp
  100ef9:	89 e5                	mov    %esp,%ebp
  100efb:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100f00:	31 c0                	xor    %eax,%eax
  100f02:	ee                   	out    %al,(%dx)
  100f03:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100f08:	b0 80                	mov    $0x80,%al
  100f0a:	ee                   	out    %al,(%dx)
  100f0b:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100f10:	b0 01                	mov    $0x1,%al
  100f12:	ee                   	out    %al,(%dx)
  100f13:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100f18:	31 c0                	xor    %eax,%eax
  100f1a:	ee                   	out    %al,(%dx)
  100f1b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100f20:	b0 03                	mov    $0x3,%al
  100f22:	ee                   	out    %al,(%dx)
  100f23:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100f28:	b0 c7                	mov    $0xc7,%al
  100f2a:	ee                   	out    %al,(%dx)
  100f2b:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100f30:	b0 0b                	mov    $0xb,%al
  100f32:	ee                   	out    %al,(%dx)
  100f33:	5d                   	pop    %ebp
  100f34:	c3                   	ret    
  100f35:	8d 76 00             	lea    0x0(%esi),%esi

00100f38 <putChar>:
  100f38:	55                   	push   %ebp
  100f39:	89 e5                	mov    %esp,%ebp
  100f3b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f3e:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100f43:	90                   	nop
  100f44:	ec                   	in     (%dx),%al
  100f45:	a8 20                	test   $0x20,%al
  100f47:	74 fb                	je     100f44 <putChar+0xc>
  100f49:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100f4e:	88 c8                	mov    %cl,%al
  100f50:	ee                   	out    %al,(%dx)
  100f51:	5d                   	pop    %ebp
  100f52:	c3                   	ret    
  100f53:	90                   	nop

00100f54 <video_print>:
  100f54:	55                   	push   %ebp
  100f55:	89 e5                	mov    %esp,%ebp
  100f57:	57                   	push   %edi
  100f58:	8b 45 08             	mov    0x8(%ebp),%eax
  100f5b:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100f5e:	c1 e0 04             	shl    $0x4,%eax
  100f61:	03 45 0c             	add    0xc(%ebp),%eax
  100f64:	01 c0                	add    %eax,%eax
  100f66:	89 c7                	mov    %eax,%edi
  100f68:	b4 0c                	mov    $0xc,%ah
  100f6a:	8b 55 10             	mov    0x10(%ebp),%edx
  100f6d:	88 d0                	mov    %dl,%al
  100f6f:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100f73:	5f                   	pop    %edi
  100f74:	5d                   	pop    %ebp
  100f75:	c3                   	ret    
  100f76:	66 90                	xchg   %ax,%ax

00100f78 <abort>:
  100f78:	55                   	push   %ebp
  100f79:	89 e5                	mov    %esp,%ebp
  100f7b:	57                   	push   %edi
  100f7c:	56                   	push   %esi
  100f7d:	53                   	push   %ebx
  100f7e:	83 ec 1c             	sub    $0x1c,%esp
  100f81:	e8 52 f4 ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  100f86:	81 c3 7a 20 00 00    	add    $0x207a,%ebx
  100f8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100f8f:	fa                   	cli    
  100f90:	8a 11                	mov    (%ecx),%dl
  100f92:	8d 83 52 00 00 00    	lea    0x52(%ebx),%eax
  100f98:	84 d2                	test   %dl,%dl
  100f9a:	74 0b                	je     100fa7 <abort+0x2f>
  100f9c:	40                   	inc    %eax
  100f9d:	41                   	inc    %ecx
  100f9e:	88 50 ff             	mov    %dl,-0x1(%eax)
  100fa1:	8a 11                	mov    (%ecx),%dl
  100fa3:	84 d2                	test   %dl,%dl
  100fa5:	75 f5                	jne    100f9c <abort+0x24>
  100fa7:	8d 70 01             	lea    0x1(%eax),%esi
  100faa:	c6 00 3a             	movb   $0x3a,(%eax)
  100fad:	8d 8b 75 01 00 00    	lea    0x175(%ebx),%ecx
  100fb3:	bf 0a 00 00 00       	mov    $0xa,%edi
  100fb8:	49                   	dec    %ecx
  100fb9:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fbc:	99                   	cltd   
  100fbd:	f7 ff                	idiv   %edi
  100fbf:	8d 42 30             	lea    0x30(%edx),%eax
  100fc2:	88 45 e7             	mov    %al,-0x19(%ebp)
  100fc5:	88 01                	mov    %al,(%ecx)
  100fc7:	b8 67 66 66 66       	mov    $0x66666667,%eax
  100fcc:	f7 6d 0c             	imull  0xc(%ebp)
  100fcf:	c1 fa 02             	sar    $0x2,%edx
  100fd2:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fd5:	c1 f8 1f             	sar    $0x1f,%eax
  100fd8:	29 c2                	sub    %eax,%edx
  100fda:	89 55 0c             	mov    %edx,0xc(%ebp)
  100fdd:	75 d9                	jne    100fb8 <abort+0x40>
  100fdf:	46                   	inc    %esi
  100fe0:	41                   	inc    %ecx
  100fe1:	8a 45 e7             	mov    -0x19(%ebp),%al
  100fe4:	88 46 ff             	mov    %al,-0x1(%esi)
  100fe7:	8a 01                	mov    (%ecx),%al
  100fe9:	88 45 e7             	mov    %al,-0x19(%ebp)
  100fec:	84 c0                	test   %al,%al
  100fee:	75 ef                	jne    100fdf <abort+0x67>
  100ff0:	c6 06 0a             	movb   $0xa,(%esi)
  100ff3:	0f be 83 40 00 00 00 	movsbl 0x40(%ebx),%eax
  100ffa:	84 c0                	test   %al,%al
  100ffc:	74 1a                	je     101018 <abort+0xa0>
  100ffe:	8d b3 40 00 00 00    	lea    0x40(%ebx),%esi
  101004:	83 ec 0c             	sub    $0xc,%esp
  101007:	50                   	push   %eax
  101008:	e8 2b ff ff ff       	call   100f38 <putChar>
  10100d:	46                   	inc    %esi
  10100e:	0f be 06             	movsbl (%esi),%eax
  101011:	83 c4 10             	add    $0x10,%esp
  101014:	84 c0                	test   %al,%al
  101016:	75 ec                	jne    101004 <abort+0x8c>
  101018:	f4                   	hlt    
  101019:	eb fd                	jmp    101018 <abort+0xa0>
  10101b:	90                   	nop

0010101c <kEntry>:
  10101c:	55                   	push   %ebp
  10101d:	89 e5                	mov    %esp,%ebp
  10101f:	53                   	push   %ebx
  101020:	50                   	push   %eax
  101021:	e8 b2 f3 ff ff       	call   1003d8 <__x86.get_pc_thunk.bx>
  101026:	81 c3 da 1f 00 00    	add    $0x1fda,%ebx
  10102c:	e8 c7 fe ff ff       	call   100ef8 <initSerial>
  101031:	e8 3a f0 ff ff       	call   100070 <initIdt>
  101036:	e8 c5 ef ff ff       	call   100000 <initIntr>
  10103b:	e8 18 f0 ff ff       	call   100058 <initTimer>
  101040:	e8 e7 f8 ff ff       	call   10092c <initSeg>
  101045:	e8 de fc ff ff       	call   100d28 <initPCB>
  10104a:	e8 cd fa ff ff       	call   100b1c <loadUMain>
  10104f:	eb fe                	jmp    10104f <kEntry+0x33>

00101051 <vec0>:
  101051:	6a 00                	push   $0x0
  101053:	6a 00                	push   $0x0
  101055:	eb 61                	jmp    1010b8 <asmDoIrq>

00101057 <vec1>:
  101057:	6a 00                	push   $0x0
  101059:	6a 01                	push   $0x1
  10105b:	eb 5b                	jmp    1010b8 <asmDoIrq>

0010105d <vec2>:
  10105d:	6a 00                	push   $0x0
  10105f:	6a 02                	push   $0x2
  101061:	eb 55                	jmp    1010b8 <asmDoIrq>

00101063 <vec3>:
  101063:	6a 00                	push   $0x0
  101065:	6a 03                	push   $0x3
  101067:	eb 4f                	jmp    1010b8 <asmDoIrq>

00101069 <vec4>:
  101069:	6a 00                	push   $0x0
  10106b:	6a 04                	push   $0x4
  10106d:	eb 49                	jmp    1010b8 <asmDoIrq>

0010106f <vec5>:
  10106f:	6a 00                	push   $0x0
  101071:	6a 05                	push   $0x5
  101073:	eb 43                	jmp    1010b8 <asmDoIrq>

00101075 <vec6>:
  101075:	6a 00                	push   $0x0
  101077:	6a 06                	push   $0x6
  101079:	eb 3d                	jmp    1010b8 <asmDoIrq>

0010107b <vec7>:
  10107b:	6a 00                	push   $0x0
  10107d:	6a 07                	push   $0x7
  10107f:	eb 37                	jmp    1010b8 <asmDoIrq>

00101081 <vec8>:
  101081:	6a 08                	push   $0x8
  101083:	eb 33                	jmp    1010b8 <asmDoIrq>

00101085 <vec9>:
  101085:	6a 00                	push   $0x0
  101087:	6a 09                	push   $0x9
  101089:	eb 2d                	jmp    1010b8 <asmDoIrq>

0010108b <vec10>:
  10108b:	6a 0a                	push   $0xa
  10108d:	eb 29                	jmp    1010b8 <asmDoIrq>

0010108f <vec11>:
  10108f:	6a 0b                	push   $0xb
  101091:	eb 25                	jmp    1010b8 <asmDoIrq>

00101093 <vec12>:
  101093:	6a 0c                	push   $0xc
  101095:	eb 21                	jmp    1010b8 <asmDoIrq>

00101097 <vec13>:
  101097:	6a 0d                	push   $0xd
  101099:	eb 1d                	jmp    1010b8 <asmDoIrq>

0010109b <vec14>:
  10109b:	6a 0e                	push   $0xe
  10109d:	eb 19                	jmp    1010b8 <asmDoIrq>

0010109f <irqEmpty>:
  10109f:	6a 00                	push   $0x0
  1010a1:	6a ff                	push   $0xffffffff
  1010a3:	eb 13                	jmp    1010b8 <asmDoIrq>

001010a5 <irqGProtectFault>:
  1010a5:	6a 0d                	push   $0xd
  1010a7:	eb 0f                	jmp    1010b8 <asmDoIrq>

001010a9 <timerInterrupt>:
  1010a9:	6a 00                	push   $0x0
  1010ab:	6a 20                	push   $0x20
  1010ad:	eb 09                	jmp    1010b8 <asmDoIrq>

001010af <irqSyscall>:
  1010af:	6a 00                	push   $0x0
  1010b1:	68 80 00 00 00       	push   $0x80
  1010b6:	eb 00                	jmp    1010b8 <asmDoIrq>

001010b8 <asmDoIrq>:
  1010b8:	60                   	pusha  
  1010b9:	1e                   	push   %ds
  1010ba:	06                   	push   %es
  1010bb:	0f a0                	push   %fs
  1010bd:	0f a8                	push   %gs
  1010bf:	54                   	push   %esp
  1010c0:	e8 d3 f6 ff ff       	call   100798 <irqHandle>
  1010c5:	83 c4 04             	add    $0x4,%esp
  1010c8:	0f a9                	pop    %gs
  1010ca:	0f a1                	pop    %fs
  1010cc:	07                   	pop    %es
  1010cd:	1f                   	pop    %ds
  1010ce:	61                   	popa   
  1010cf:	83 c4 04             	add    $0x4,%esp
  1010d2:	83 c4 04             	add    $0x4,%esp
  1010d5:	cf                   	iret   

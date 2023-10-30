	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	sort
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	sort, %function
sort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	lr, r1, #1
	cmp	lr, #0
	ble	.L1
	add	ip, r0, lr, lsl #2
.L3:
	mov	r3, r0
.L5:
	ldr	r2, [r3]
	ldr	r1, [r3, #4]!
	cmp	r2, r1
	stmdalt	r3, {r1, r2}
	cmp	ip, r3
	bne	.L5
	subs	lr, lr, #1
	sub	ip, ip, #4
	bne	.L3
.L1:
	ldr	lr, [sp], #4
	bx	lr
	.size	sort, .-sort
	.align	2
	.global	set_plate
	.syntax unified
	.arm
	.fpu softvfp
	.type	set_plate, %function
set_plate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, .L16
	sub	sp, sp, #36
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2}
	stmia	ip!, {r0, r1}
	add	r3, sp, #32
	rsb	r0, r3, #83886080
	strh	r2, [ip]	@ movhi
	add	r0, r0, #516
	add	r3, sp, #2
	add	ip, sp, #28
.L13:
	add	r2, r0, r3
	ldrh	r1, [r3, #2]!
	cmp	r3, ip
	strh	r1, [r2]	@ movhi
	bne	.L13
	add	sp, sp, #36
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR0
	.size	set_plate, .-set_plate
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L90
	ldrh	r3, [r3]
	ldr	r5, .L90+4
	tst	r3, #32
	ldr	r2, [r5, #20]
	sub	sp, sp, #12
	beq	.L19
	ldr	r1, .L90+8
	ldrh	r1, [r1]
	tst	r1, #32
	beq	.L83
.L19:
	tst	r3, #16
	and	r3, r3, #256
	beq	.L20
	ldr	r1, .L90+8
	ldrh	r1, [r1]
	tst	r1, #16
	bne	.L20
	cmp	r2, #7
	beq	.L84
.L20:
	cmp	r3, #0
	bne	.L75
	ldr	r1, .L90+12
.L23:
	cmp	r2, #11
	beq	.L85
.L24:
	cmp	r2, #10
	beq	.L22
.L45:
	ldr	r0, .L90+16
	ldr	r2, [r1]
	ldr	r3, [r0]
	sub	r2, r2, #1
	sub	r3, r3, #1
	cmp	r2, #0
	str	r3, [r0]
	str	r2, [r1]
	blt	.L77
	ldr	r2, .L90+20
	str	r2, [sp, #4]
.L26:
	cmp	r3, #0
	ble	.L86
.L28:
	mov	r6, #0
	ldr	r2, .L90+24
	ldr	r3, .L90+28
	ldr	r9, [r2]
	ldr	r2, [sp, #4]
	add	r7, r5, #16
	mov	ip, #3
	mov	r10, r6
	mov	r4, #67108864
	ldm	r7, {r7, lr}
	ldr	r8, [r2]
	ldr	fp, .L90+32
	add	r0, r3, #1120
	b	.L42
.L39:
	add	r3, r3, #28
	cmp	r3, r0
	beq	.L87
.L42:
	ldr	r2, [r3, #8]
	cmp	r2, #4
	bne	.L39
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #20]
	sub	r2, r2, #2
	rsb	r1, r1, #20
	cmp	r2, r1
	strle	ip, [r3, #8]
	cmp	r2, #19
	str	r2, [r3, #4]
	bgt	.L39
	ldr	r2, [r3, #24]
	cmp	r2, lr
	bne	.L39
	ldr	r2, [r3, #12]
	cmp	r2, #5
	str	ip, [r3, #8]
	beq	.L88
	cmp	r7, #2
	beq	.L39
	mov	r2, #22272	@ movhi
	strh	r2, [r4, #104]	@ movhi
	ldr	r2, .L90+36
	strh	r2, [r4, #108]	@ movhi
	mov	r2, #51	@ movhi
	mov	r6, #1
	strh	r2, [r4, #96]	@ movhi
	mov	r2, #62208
	add	r3, r3, #28
	cmp	r3, r0
	strh	r2, [r4, #98]	@ movhi
	mov	r7, r6
	strh	fp, [r4, #100]	@ movhi
	sub	r8, r8, #1
	bne	.L42
.L87:
	cmp	r10, #0
	ldrne	r3, .L90+24
	strne	r9, [r3]
	cmp	r6, #0
	ldrne	r3, [sp, #4]
	strne	r7, [r5, #16]
	strne	r8, [r3]
.L18:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L75:
	ldr	r3, .L90+8
	ldrh	r3, [r3]
	tst	r3, #256
	ldr	r1, .L90+12
	bne	.L23
	ldr	r3, [r1]
	cmp	r3, #0
	bge	.L23
.L46:
	ldr	r3, [r5, #16]
	cmp	r3, #2
	movne	r0, #2
	movne	r3, #60
	strne	r0, [r5, #16]
	strne	r3, [r1]
	cmp	r2, #11
	bne	.L24
.L85:
	ldr	r3, [r5, #8]
	sub	r3, r3, #3
	cmp	r3, #80
	str	r3, [r5, #8]
	movle	r3, #7
	strle	r3, [r5, #20]
	b	.L45
.L83:
	cmp	r2, #8
	moveq	r1, #11
	moveq	r2, r1
	streq	r1, [r5, #20]
	b	.L19
.L88:
	mov	r2, #20992
	mov	r10, #1
	strh	r2, [r4, #104]	@ movhi
	add	r9, r9, #1
	strh	fp, [r4, #108]	@ movhi
	b	.L39
.L86:
	ldr	r6, .L90+28
	mov	r2, #10
	mov	r4, #0
	mov	r7, r6
	mov	r3, r6
	str	r2, [r0]
.L30:
	ldr	r2, [r3, #8]
	cmp	r2, #3
	beq	.L29
	add	r4, r4, #1
	cmp	r4, #40
	add	r3, r3, #28
	bne	.L30
.L31:
	ldr	r3, [r6, #8]
	cmp	r3, #3
	mov	r4, #0
	beq	.L34
.L89:
	add	r4, r4, #1
	cmp	r4, #40
	add	r6, r6, #28
	beq	.L28
	ldr	r3, [r6, #8]
	cmp	r3, #3
	bne	.L89
.L34:
	mov	r1, #160
	mov	r0, #150
	mov	r8, #8
	rsb	r3, r4, r4, lsl #3
	add	r6, r7, r3, lsl #2
	str	r1, [r6, #4]
	str	r0, [r7, r3, lsl #2]
	ldr	r2, .L90+40
	str	r8, [r6, #24]
	mov	lr, pc
	bx	r2
	ldr	r3, .L90+44
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #25
	movle	r2, #14
	movgt	r2, #9
	movle	r0, #6
	movle	r1, #10
	movgt	r1, #5
	str	r2, [r6, #20]
	mov	r2, #4
	lsl	r3, r4, #3
	sub	r4, r3, r4
	add	r7, r7, r4, lsl #2
	strle	r0, [r6, #12]
	strle	r1, [r6, #16]
	strgt	r8, [r6, #16]
	strgt	r1, [r6, #12]
	str	r2, [r7, #8]
	b	.L28
.L77:
	ldr	r2, [r5, #16]
	cmp	r2, #2
	ldr	r2, .L90+20
	str	r2, [sp, #4]
	bne	.L26
	ldr	r2, [r2]
	subs	r2, r2, #3
	movne	r2, #1
	ldr	ip, .L90+48
	str	r2, [r5, #16]
	str	ip, [r1]
	b	.L26
.L29:
	mov	r1, #7
	mov	r2, #160
	mov	r0, #80
	rsb	r3, r4, r4, lsl #3
	add	r8, r7, r3, lsl #2
	str	r1, [r8, #24]
	str	r0, [r7, r3, lsl #2]
	str	r2, [r8, #4]
	ldr	r3, .L90+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+44
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #25
	movle	r2, #14
	movgt	r2, #9
	movle	r0, #6
	movle	r1, #10
	movgt	r0, #5
	movgt	r1, #8
	str	r2, [r8, #20]
	mov	r2, #4
	lsl	r3, r4, #3
	sub	r3, r3, r4
	add	r3, r7, r3, lsl #2
	str	r0, [r8, #12]
	str	r1, [r8, #16]
	str	r2, [r3, #8]
	b	.L31
.L84:
	mov	r2, #10
	cmp	r3, #0
	str	r2, [r5, #20]
	bne	.L21
.L81:
	ldr	r1, .L90+12
.L22:
	ldr	r3, [r5, #8]
	add	r3, r3, #3
	cmp	r3, #149
	str	r3, [r5, #8]
	movgt	r3, #8
	strgt	r3, [r5, #20]
	b	.L45
.L21:
	tst	r1, #256
	bne	.L81
	ldr	r1, .L90+12
	ldr	r3, [r1]
	cmp	r3, #0
	bge	.L22
	b	.L46
.L91:
	.align	2
.L90:
	.word	oldButtons
	.word	player
	.word	buttons
	.word	super_time
	.word	generate_time
	.word	health
	.word	score
	.word	foods
	.word	-30804
	.word	-31429
	.word	rand
	.word	1374389535
	.word	1800
	.size	updateGame, .-updateGame
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"score:%d\000"
	.align	2
.LC2:
	.ascii	"lives:%d\000"
	.text
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, #251
	ldr	r3, .L105
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r4, .L105+4
	ldr	r6, .L105+8
	ldr	r7, .L105+12
	ldr	r8, .L105+16
	add	r5, r4, #1120
.L95:
	ldr	r3, [r4, #8]
	cmp	r3, #3
	beq	.L93
	ldr	r3, [r4, #12]
	add	r2, r4, #16
	cmp	r3, #6
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	streq	r8, [sp]
	strne	r7, [sp]
	mov	lr, pc
	bx	r6
.L93:
	add	r4, r4, #28
	cmp	r5, r4
	bne	.L95
	mov	r3, #251
	ldr	r4, .L105+20
	ldm	r4, {r0, r2}
	mov	r1, #0
	str	r3, [sp]
	ldr	r5, .L105+24
	mov	r3, #20
	sub	r2, r2, r0
	mov	lr, pc
	bx	r5
	ldr	ip, .L105+28
	ldr	r3, [ip, #16]
	cmp	r3, #0
	beq	.L104
	cmp	r3, #1
	add	r0, ip, #8
	ldm	ip, {r2, r3}
	ldreq	ip, .L105+32
	ldrne	ip, .L105+36
	ldm	r0, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r6
.L97:
	mov	r6, #248
	str	r6, [sp]
	mov	r3, #160
	ldr	r0, [r4]
	mov	r2, #2
	mov	r1, #0
	mov	lr, pc
	bx	r5
	str	r6, [sp]
	mov	r3, #160
	ldr	r0, [r4, #4]
	mov	r2, #2
	mov	r1, #0
	mov	lr, pc
	bx	r5
	ldm	r4, {r0, r2}
	mov	r3, #2
	str	r6, [sp]
	sub	r2, r2, r0
	mov	r1, #20
	mov	lr, pc
	bx	r5
	ldr	r3, .L105+40
	ldr	r6, .L105+44
	ldr	r2, [r3]
	ldr	r1, .L105+48
	ldr	r0, .L105+52
	mov	lr, pc
	bx	r6
	ldr	r5, .L105+56
	mov	r3, #247
	mov	r1, #1
	mov	r0, #0
	ldr	r2, .L105+52
	mov	lr, pc
	bx	r5
	ldr	r3, .L105+60
	ldr	r1, .L105+64
	ldr	r2, [r3]
	ldr	r0, .L105+52
	mov	lr, pc
	bx	r6
	ldr	r0, [r4, #4]
	mov	r3, #247
	mov	r1, #1
	ldr	r2, .L105+52
	add	r0, r0, #2
	mov	lr, pc
	bx	r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L104:
	ldr	r2, .L105+68
	ldr	r3, [ip, #4]
	str	r2, [sp]
	add	r0, ip, #8
	ldr	r2, [ip]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r6
	b	.L97
.L106:
	.align	2
.L105:
	.word	fillScreen4
	.word	foods
	.word	drawImage4
	.word	hamburgerBitmap
	.word	bombBitmap
	.word	gameSettings
	.word	myDrawRect4
	.word	player
	.word	playerHurtBitmap
	.word	playerSuperBitmap
	.word	score
	.word	sprintf
	.word	.LC1
	.word	buffer
	.word	drawString4
	.word	health
	.word	.LC2
	.word	playerBitmap
	.size	drawGame, .-drawGame
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #3
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #50
	mov	r6, #188
	mov	r3, #0
	mov	r5, #80
	mov	r4, #2
	mov	lr, #10
	mov	ip, #16
	mov	r0, #7
	ldr	r8, .L111
	mov	r1, r2
	str	r2, [r8]
	ldr	r2, .L111+4
	str	r7, [r2]
	str	r6, [r2, #4]
	ldr	r2, .L111+8
	str	r3, [r2]
	ldr	r2, .L111+12
	str	r3, [r2]
	ldr	r2, .L111+16
	str	r3, [r2]
	ldr	r2, .L111+20
	str	r3, [r2, #16]
	ldr	r3, .L111+24
	str	r5, [r2, #8]
	str	r4, [r2, #12]
	str	lr, [r2]
	str	ip, [r2, #4]
	str	r0, [r2, #20]
	add	r2, r3, #1120
.L108:
	str	r1, [r3, #8]
	add	r3, r3, #28
	cmp	r3, r2
	bne	.L108
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	health
	.word	gameSettings
	.word	score
	.word	generate_time
	.word	super_time
	.word	player
	.word	foods
	.size	initGame, .-initGame
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"RANK %d : %d\000"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r1, .L124
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r4, .L124+4
	mov	lr, pc
	bx	r4
	mvn	r2, #32768
	ldr	r3, .L124+8
	ldr	r0, .L124+12
	strh	r2, [r3, #254]	@ movhi
	ldr	r3, .L124+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L124+20
	ldr	r0, .L124+24
	ldr	r3, [r3]
	mov	r1, #4
	str	r3, [r0, #12]
	bl	sort
	ldr	r3, [r0]
	cmp	r3, #0
	ble	.L114
	mov	r4, #0
	cmp	r3, #0
	ldr	r9, .L124+28
	ldr	r6, .L124+32
	ldr	r8, .L124+36
	ldr	r7, .L124+40
	add	r5, r0, #4
	add	r4, r4, #1
	ble	.L115
.L122:
	mov	r2, r4
	mov	r1, r9
	mov	r0, r6
	mov	lr, pc
	bx	r8
	add	r1, r4, r4, lsl #2
	lsl	r1, r1, #1
	mov	r3, #255
	mov	r2, r6
	mov	r0, #75
	add	r1, r1, #75
	mov	lr, pc
	bx	r7
.L115:
	cmp	r4, #3
	beq	.L114
.L123:
	ldr	r3, [r5], #4
	cmp	r3, #0
	add	r4, r4, #1
	bgt	.L122
	cmp	r4, #3
	bne	.L123
.L114:
	ldr	r3, .L124+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L124+48
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L124+52
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	r2, [r3]
	bx	lr
.L125:
	.align	2
.L124:
	.word	welcomePal
	.word	DMANow
	.word	83886336
	.word	welcomeBitmap
	.word	drawFullscreenImage4
	.word	score
	.word	.LANCHOR1
	.word	.LC3
	.word	buffer
	.word	sprintf
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #128
	mvn	ip, #170
	mov	r0, #2
	mov	r2, #0
	str	lr, [sp, #-4]!
	ldr	lr, .L128
	strh	lr, [r3]	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r1, .L128+4
	strh	r0, [r3, #130]	@ movhi
	ldr	r0, .L128+8
	ldrh	ip, [r1, #48]
	ldr	r3, .L128+12
	ldr	r1, .L128+16
	ldr	lr, [sp], #4
	strh	ip, [r0]	@ movhi
	strh	r2, [r1]	@ movhi
	str	r2, [r3]
	b	goToStart
.L129:
	.align	2
.L128:
	.word	1044
	.word	67109120
	.word	buttons
	.word	score
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L132
	ldr	r4, .L132+4
	mov	lr, pc
	bx	r4
	bl	set_plate
	mov	r2, #1
	ldr	r3, .L132+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L133:
	.align	2
.L132:
	.word	plate
	.word	DMANow
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L141
	ldr	r3, [r4]
	ldr	r2, .L141+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L141+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L134
	ldr	r3, .L141+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L140
.L134:
	pop	{r4, lr}
	bx	lr
.L140:
	ldr	r0, [r4]
	ldr	r3, .L141+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	pop	{r4, lr}
	b	initGame
.L142:
	.align	2
.L141:
	.word	rSeed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.size	start, .-start
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"game now pausing\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #255
	ldr	r3, .L145
	mov	lr, pc
	bx	r3
	mov	r1, #75
	ldr	r2, .L145+4
	mov	r0, r1
	mov	r3, #253
	ldr	r4, .L145+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L145+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L145+16
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L145+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L146:
	.align	2
.L145:
	.word	fillScreen4
	.word	.LC4
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #255
	ldr	r3, .L159
	mov	lr, pc
	bx	r3
	mov	r1, #75
	ldr	r2, .L159+4
	mov	r0, r1
	mov	r3, #253
	ldr	r4, .L159+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L159+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L159+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L159+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L148
	ldr	r2, .L159+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L157
.L148:
	tst	r3, #4
	beq	.L147
	ldr	r3, .L159+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L158
.L147:
	pop	{r4, lr}
	bx	lr
.L157:
	pop	{r4, lr}
	b	goToGame
.L158:
	pop	{r4, lr}
	b	goToStart
.L160:
	.align	2
.L159:
	.word	fillScreen4
	.word	.LC4
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"YOU WIN!\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #254
	ldr	r3, .L163
	mov	lr, pc
	bx	r3
	ldr	r4, .L163+4
	ldr	r2, .L163+8
	mov	r1, #75
	mov	r0, #90
	mov	r3, #243
	mov	lr, pc
	bx	r4
	ldr	r3, .L163+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L163+16
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L163+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L164:
	.align	2
.L163:
	.word	fillScreen4
	.word	drawString4
	.word	.LC5
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L172
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L172+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L165
	ldr	r3, .L172+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L171
.L165:
	pop	{r4, lr}
	bx	lr
.L171:
	pop	{r4, lr}
	b	goToStart
.L173:
	.align	2
.L172:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"YOU LOST!\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #252
	ldr	r3, .L176
	mov	lr, pc
	bx	r3
	ldr	r4, .L176+4
	ldr	r2, .L176+8
	mov	r3, #253
	mov	r1, #75
	mov	r0, #90
	ldr	r5, .L176+12
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r4
	ldr	r3, .L176+16
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L176+20
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L177:
	.align	2
.L176:
	.word	fillScreen4
	.word	waitForVBlank
	.word	.LC6
	.word	drawString4
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateGame
	bl	drawGame
	ldr	r3, .L189
	mov	lr, pc
	bx	r3
	ldr	r3, .L189+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L189+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L179
	ldr	r3, .L189+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L186
.L179:
	ldr	r3, .L189+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L187
	ldr	r3, .L189+20
	ldr	r3, [r3]
	cmp	r3, #30
	beq	.L188
.L178:
	pop	{r4, lr}
	bx	lr
.L187:
	bl	goToLose
	ldr	r3, .L189+20
	ldr	r3, [r3]
	cmp	r3, #30
	bne	.L178
.L188:
	pop	{r4, lr}
	b	goToWin
.L186:
	bl	goToPause
	b	.L179
.L190:
	.align	2
.L189:
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	health
	.word	score
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L202
	mov	lr, pc
	bx	r3
	ldr	r6, .L202+4
	ldr	fp, .L202+8
	ldr	r5, .L202+12
	ldr	r10, .L202+16
	ldr	r9, .L202+20
	ldr	r8, .L202+24
	ldr	r7, .L202+28
	ldr	r4, .L202+32
.L192:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L193:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L193
.L195:
	.word	.L198
	.word	.L197
	.word	.L196
	.word	.L194
	.word	.L194
.L194:
	mov	lr, pc
	bx	r7
	b	.L192
.L196:
	mov	lr, pc
	bx	r8
	b	.L192
.L197:
	mov	lr, pc
	bx	r9
	b	.L192
.L198:
	mov	lr, pc
	bx	r10
	b	.L192
.L203:
	.align	2
.L202:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	foods,1120,4
	.comm	player,24,4
	.comm	gameSettings,8,4
	.global	his_scores
	.comm	buffer,40,4
	.comm	rSeed,4,4
	.comm	state,4,4
	.comm	super_time,4,4
	.comm	generate_time,4,4
	.comm	health,4,4
	.comm	score,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	NOTES,2,2
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	0
	.short	3173
	.short	9522
	.short	7415
	.short	1626
	.short	5322
	.short	10583
	.short	26427
	.short	32767
	.short	13526
	.short	1023
	.short	992
	.short	32625
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	his_scores, %object
	.size	his_scores, 16
his_scores:
	.space	16
	.ident	"GCC: (devkitARM release 53) 9.1.0"

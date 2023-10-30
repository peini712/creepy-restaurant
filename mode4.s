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
	.file	"mode4.c"
	.text
	.align	2
	.global	setPixel4
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	biceq	r3, r3, #255
	orrne	r3, r3, r2, lsl #8
	orreq	r3, r3, r2
	strh	r3, [ip, r1]	@ movhi
	bx	lr
.L6:
	.align	2
.L5:
	.word	videoBuffer
	.size	setPixel4, .-setPixel4
	.align	2
	.global	myDrawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	myDrawRect4, %function
myDrawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r2, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, lr}
	add	r6, r1, r3
	ldr	r1, .L20
	rsb	r2, r6, r6, lsl #4
	add	ip, ip, r0
	sub	r7, r3, r3, lsl #4
	ldr	lr, [r1]
	add	r4, r0, r2, lsl #4
	add	r6, ip, r2, lsl #4
	lsl	r7, r7, #4
.L9:
	cmp	r3, #0
	andgt	r5, r4, #1
	addgt	r1, r4, r7
	ble	.L14
.L12:
	add	r0, r1, r1, lsr #31
	bic	r0, r0, #1
	ldrb	ip, [sp, #24]	@ zero_extendqisi2
	ldrh	r2, [lr, r0]
	cmp	r5, #0
	and	r8, r2, #255
	and	ip, ip, #255
	biceq	r2, r2, #255
	orreq	r2, r2, ip
	orr	r8, r8, ip, lsl #8
	add	r1, r1, #240
	strhne	r8, [lr, r0]	@ movhi
	strheq	r2, [lr, r0]	@ movhi
	cmp	r4, r1
	bne	.L12
.L14:
	add	r4, r4, #1
	cmp	r4, r6
	bne	.L9
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	videoBuffer
	.size	myDrawRect4, .-myDrawRect4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, r2
	add	r5, r3, r1
	asr	r2, r2, #1
	add	r3, r7, r7, lsr #31
	rsb	r1, r1, r1, lsl #4
	sub	ip, r2, #1
	add	r9, r0, r7
	asr	r3, r3, #1
	sub	sp, sp, #20
	rsb	r5, r5, r5, lsl #4
	sub	r9, r9, #1
	add	r4, r0, r1, lsl #4
	orr	r2, r2, #16777216
	orr	r1, ip, #16777216
	orr	r3, r3, #16777216
	ldr	r8, .L50
	str	r1, [sp, #12]
	str	r2, [sp, #4]
	str	r3, [sp, #8]
	add	r5, r0, r5, lsl #4
	and	r9, r9, #1
	and	r6, r0, #1
	and	r10, r7, #1
	sub	fp, r7, #1
	b	.L36
.L49:
	cmp	r10, #0
	beq	.L46
	cmp	r7, #1
	bgt	.L47
.L34:
	add	r2, fp, r4
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	ldrb	r0, [sp, #56]	@ zero_extendqisi2
	ldrh	r1, [r3, r2]
	cmp	r9, #0
	and	r0, r0, #255
	andne	r1, r1, #255
	biceq	r1, r1, #255
	orrne	r1, r1, r0, lsl #8
	orreq	r1, r1, r0
	strh	r1, [r3, r2]	@ movhi
.L26:
	add	r4, r4, #240
	cmp	r5, r4
	beq	.L48
.L36:
	cmp	r6, #0
	ldr	r3, [r8]
	beq	.L49
	add	r2, r4, r4, lsr #31
	bic	r2, r2, #1
	ldrb	r0, [sp, #56]	@ zero_extendqisi2
	ldrh	r1, [r3, r2]
	cmp	r10, #0
	and	r1, r1, #255
	beq	.L29
	orr	r1, r1, r0, lsl #8
	cmp	r7, #1
	strh	r1, [r3, r2]	@ movhi
	ble	.L26
	add	r2, r4, #1
	ldr	r3, [r8]
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	mov	r0, #3
	ldr	r3, [sp, #4]
	ldr	ip, .L50+4
	add	r1, sp, #56
	add	r4, r4, #240
	mov	lr, pc
	bx	ip
	cmp	r5, r4
	bne	.L36
.L48:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L29:
	orr	r1, r1, r0, lsl #8
	cmp	r7, #2
	strh	r1, [r3, r2]	@ movhi
	ble	.L34
	add	r2, r4, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	ldr	r3, [sp, #12]
.L45:
	mov	r0, #3
	ldr	ip, .L50+4
	add	r1, sp, #56
	mov	lr, pc
	bx	ip
	ldr	r3, [r8]
	b	.L34
.L46:
	add	r2, r4, r4, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	mov	r0, #3
	ldr	r3, [sp, #8]
	ldr	ip, .L50+4
	add	r1, sp, #56
	mov	lr, pc
	bx	ip
	b	.L26
.L47:
	add	r2, r4, r4, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	ldr	r3, [sp, #4]
	b	.L45
.L51:
	.align	2
.L50:
	.word	videoBuffer
	.word	DMANow
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #16
	strb	r0, [sp, #7]
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	lsl	ip, ip, #16
	ldrb	r1, [sp, #7]	@ zero_extendqisi2
	orr	ip, ip, r3, lsl #24
	ldr	r3, .L54
	orr	ip, ip, r1
	orr	ip, ip, r2, lsl #8
	mov	r0, #3
	ldr	r2, [r3]
	ldr	r4, .L54+4
	ldr	r3, .L54+8
	add	r1, sp, #12
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	videoBuffer
	.word	DMANow
	.word	83895680
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r6, r1, r3
	add	r2, r2, r2, lsr #31
	rsb	r6, r6, r6, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldr	r5, [sp, #32]
	ldr	r9, .L64
	ldr	r8, .L64+4
	add	r6, r0, r6, lsl #4
	add	r4, r0, r1, lsl #4
	asr	r10, r2, #1
	bic	r7, r2, #1
.L58:
	ldr	r3, [r9]
	add	r2, r4, r4, lsr #31
	bic	r2, r2, #1
	mov	r1, r5
	add	r2, r3, r2
	mov	r0, #3
	mov	r3, r10
	add	r4, r4, #240
	mov	lr, pc
	bx	r8
	cmp	r6, r4
	add	r5, r5, r7
	bne	.L58
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	videoBuffer
	.word	DMANow
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L68
	mov	r1, r0
	ldr	r2, [r3]
	ldr	r4, .L68+4
	mov	r3, #19200
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	videoBuffer
	.word	DMANow
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	drawChar4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar4, %function
drawChar4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	ldr	ip, .L81
	ldr	r8, .L81+4
	rsb	r1, r1, r1, lsl #4
	add	r2, r2, r2, lsl #1
	lsl	r6, r3, #24
	ldr	r4, [ip]
	add	lr, r0, r1, lsl #4
	add	r8, r8, r2, lsl #4
	asr	r6, r6, #16
	and	r7, r3, #255
.L71:
	mov	r2, #0
	add	ip, r8, r5
.L74:
	ldrb	r1, [ip], #1	@ zero_extendqisi2
	add	r3, r2, lr
	add	r3, r3, r3, lsr #31
	cmp	r1, #0
	bic	r3, r3, #1
	add	r10, r2, r0
	beq	.L72
	ldrh	r9, [r4, r3]
	and	r1, r9, #255
	tst	r10, #1
	orr	r1, r6, r1
	biceq	r9, r9, #255
	lsl	r1, r1, #16
	lsr	r1, r1, #16
	orreq	r9, r7, r9
	strhne	r1, [r4, r3]	@ movhi
	strheq	r9, [r4, r3]	@ movhi
.L72:
	add	r2, r2, #1
	cmp	r2, #6
	bne	.L74
	add	r5, r5, #6
	cmp	r5, #48
	add	lr, lr, #240
	bne	.L71
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	videoBuffer
	.word	fontdata_6x8
	.size	drawChar4, .-drawChar4
	.align	2
	.global	drawString4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString4, %function
drawString4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L83
	mov	r6, r1
	mov	r5, r3
.L85:
	mov	r3, r5
	mov	r1, r6
	bl	drawChar4
	ldrb	r2, [r4, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r0, r0, #6
	bne	.L85
.L83:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString4, .-drawString4
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L94
	moveq	r2, #100663296
	ldr	r1, .L94+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L95:
	.align	2
.L94:
	.word	100704256
	.word	videoBuffer
	.size	flipPage, .-flipPage
	.ident	"GCC: (devkitARM release 53) 9.1.0"

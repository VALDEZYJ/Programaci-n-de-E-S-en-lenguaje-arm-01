	.arch armv7-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"functions.c"
	.text
	.align	1
	.global	len
	.syntax unified
	.thumb
	.thumb_func
	.type	len, %function
len:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.

	#Prologo
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0

	#24 bytes tamaño de la funcionm len
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	b	.L2
.L3:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	subs	r3, r2, r3

	#Epilogo
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	len, .-len
	.align	1
	.global	reverse
	.syntax unified
	.thumb
	.thumb_func
	.type	reverse, %function
reverse:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	#Prologo
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #16]
	ldr	r0, [r7, #4]
	bl	len
	mov	r3, r0
	subs	r3, r3, #1
	str	r3, [r7, #20]
	b	.L6
.L7:
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldrb	r3, [r3]
	strb	r3, [r7, #15]
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	add	r2, r2, r3
	ldr	r3, [r7, #16]
	ldr	r1, [r7, #4]
	add	r3, r3, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldrb	r2, [r7, #15]
	strb	r2, [r3]
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L6:
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	blt	.L7
	nop
	nop
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	reverse, .-reverse
	.align	1
	.global	astoin
	.syntax unified
	.thumb
	.thumb_func
	.type	astoin, %function
astoin:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	#Prologo
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0

	#cuerpo de funcion
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	subs	r3, r3, #48

	#Epilogo
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	astoin, .-astoin
	.align	1
	.global	intoas
	.syntax unified
	.thumb
	.thumb_func
	.type	intoas, %function
intoas:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	#Prologo
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0

	#cuerpo de funcion
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	uxtb	r3, r3
	adds	r3, r3, #48
	uxtb	r3, r3

	#epilogo
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	intoas, .-intoas


user_input:
	#prologo
	push {r7}
	sub sp, sp, #12
	add r7, sp, #0

	#Reservamos 16 bytes
	str r1, [r7, #4] @ Bufer de entrada arg1
	str r0, [r7, #8] @ NUmero de bytes a almacenar arg2

	#cuerrpo de funcion
	mov r4, r7
	mov r7, #0x3
	mov r0, #0x0
	ldr r1, [r4, #8]
	ldr r2, [r4, #4]
	svc 0x0

	#Epilogo
	mov r7, r4
	mov r0, r3
	adds r7, r7, #12
	mov sp, r7
	pop {r7}
	bx  lr

display:
	#Prologo
	push {r7}
	sub sp, sp, #12
	add r7, sp, #0

	#16 bytes tamaño de funcion display
	str r1, [r7, #4]
	str r0, [r7, #8]

	#cuerpo de funcion
	mov r4, r7
	mov r7, #0x4
	mov r0, #0x1
	ldr r1, =second
	mov r2, #0x10
	svc 0x0

	#Epilogo
	mov r7, r4
	mov r0, r3
	adds r7, r7, #12
	mov sp, r7
	pop {r7}
	bx lr


	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	#main Prologo
	push	{r7, lr}
	sub	sp, sp, #48
	add	r7, sp, #0

	/*Buffer de entrada*/
	ldr r0, =first	@ Direccion base del buffer
	mov r1, #0x10	@ Numero de bytes a usar
   	bl user_input

	/*ldr	r3, .L17
	ldr	r3, [r3]
	str	r3, [r7, #44]*/

	/*i = 0*/
	mov	r3, #0
	movs	r3, #0
	str	r3, [r7, #4]

	b	.L13
.L14:
	/*add	r2, r7, #28*/
	ldr r2, =first
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	astoin

	mov	r2, r0
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	adds	r3, r3, #48
	add	r3, r3, r7
	str	r2, [r3, #-40]

	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	adds	r3, r3, #48
	add	r3, r3, r7
	ldr	r3, [r3, #-40]

	mov	r0, r3
	bl	intoas
	mov	r3, r0

	mov	r1, r3
	/*add	r2, r7, #36*/
	ldr r2, =second
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L13:
	ldr	r3, [r7, #4]
	cmp	r3, #4
	ble	.L14

	bl display 	@impresion
	mov r0,#0x0
	mov r7,#0x1
   	svc 0x0

	movs	r3, #0
	ldr	r2, .L17
	ldr	r1, [r2]
	ldr	r2, [r7, #44]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L16
	bl	__stack_chk_fail
.L16:
	mov	r0, r3
	adds	r7, r7, #48
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L18:
	.align	2
.L17:
	.word	__stack_chk_guard
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",%progbits

	.section .data
first:
	.skip 8
second:
	.skip 8
sum:
	.skip 8


#Este programa procesa un arreglo de enteros ascii y los convierte a enteros

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
	mov	r3, r0

	#cuerpo de la funcion
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

	#cuerpo de la funcion
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	uxtb	r3, r3
	adds	r3, r3, #48
	uxtb	r3, r3

	#Epilogo
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	intoas, .-intoas

user_input:
	#Prologo
	push {r7}
	sub sp, sp, #12
	add r7, sp, #0
	#16 bytes de memoria en la funcion user_input
	str r1, [r7, #4] 
	str r0, [r7, #8] 

	#cuerpo de funcion
	mov r4, r7
	mov r7, #0x3
	mov r0, #0x0
	ldr r1, [r4, #8]
	ldr r2, [r4, #4]
	svc 0x0
	mov r7, r4
	
	#Epilogo
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
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	#main Prologo
	push	{r7, lr}	
	sub	sp, sp, #40	
	add	r7, sp, #0	

	#direccion de buffer y manejo
	ldr r0, =first	
	mov r1, #0x10	
	#system call
   	bl user_input	

	#direccion base de buffer
	mov	r3, #0 
	ldr	r3, =first  	
	mov	r0, r3	

	#llamado a len function	
	bl	len		
	str	r0, [r7, #8] 
	#int i=0;
	movs	r3, #0		
	str	r3, [r7]	
	b	.L10 		
.L11:
	#buffer
	ldr r2, =first			
	ldr	r3, [r7]		
	add	r3, r3, r2		
	ldrb	r3, [r3]		
	mov	r0, r3			
	bl	astoin
	mov	r3, r0		

	#traemos la base de arreglo de enteros global
	uxtb	r1, r3
	add	r2, r7, #20		
	ldr	r3, [r7]		
	add	r3, r3, r2		
	mov	r2, r1	

	#guardamos en la base del arreglo	
	strb	r2, [r3]		
	ldr	r3, [r7]		
	adds	r3, r3, #1		
	str	r3, [r7]		
.L10:					
	ldr	r2, [r7]		
	ldr	r3, [r7, #8]		
	cmp	r2, r3			
	blt	.L11			
	
	movs	r3, #0			
	str	r3, [r7, #4]		
	b	.L12			
.L13:
	#base de arreglo entero
	add	r2, r7, #20		
	ldr	r3, [r7, #4]		
	add	r3, r3, r2		
	ldrb	r3, [r3]		

	
	mov	r0, r3			
	bl	intoas		
	mov	r3, r0

	#carga en buffer de salida
	mov	r1, r3			
	ldr r2, =second			
	ldr	r3, [r7, #4]		
	add	r3, r3, r2		

	mov	r2, r1			
	strb	r2, [r3] 		
	ldr	r3, [r7, #4] 		
	adds	r3, r3, #1		
	str	r3, [r7, #4]		
.L12:
	ldr	r2, [r7, #4] 	@ load i		
	ldr	r3, [r7, #8]	@ load size	
	cmp	r2, r3			
	blt	.L13 @ i<size

	bl display 		@impresion
	mov r0,#0x0
	mov r7,#0x1
   	svc 0x0
	movs	r3, #0
	# main Epilogo
	mov	r0, r3
	adds r7, r7, #40
	mov	sp, r7	
	@ sp needed
	pop	{r7, pc}	
.L16:
	.align	2
	.word	__stack_chk_guard
	.size	main, .-main
.section .data
first:
	.skip 8
second:
	.skip 8
extra:
	.skip 8

	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",%progbits
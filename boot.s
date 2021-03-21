.section .boot

init:
	ldr sp, =stack_top
	bl print_hello

print_hello:
	adr r1, message

print_string:
	ldrb r2, [r1], #1
	cmp r2, #0
	beq hang

print_character:
	ldr r3, =0x1C090000
	strb r2, [r3]
	b print_string

hang:
	b hang

message: 
	.asciz "Hello, World!"

.section .bss

stack_bottom:
	.skip 4096

stack_top:


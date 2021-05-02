	.section .text
	.global _start
	.global main

.org 0x00000000
_start:
	j _start_continue

.org 0x00000020
_trap: 
    j _trap


_start_continue:
	/* set stack pointer */
	li sp,2048

	/* jump to main C code */
	jal ra,main

	/* trap */
	ebreak


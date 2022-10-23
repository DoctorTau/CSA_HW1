    .file	"out.c"
    .intel_syntax noprefix
    .text
    .section	.rodata
.LC0:
    .string	"%d "
    .text
    .globl	PrintArrayB
    .type	PrintArrayB, @function
PrintArrayB:
    endbr64
    push	rbp # Начало функции
    mov	rbp, rsp
    sub	rsp, 32
    mov	DWORD PTR -20[rbp], edi # Получение size.
    mov	DWORD PTR -4[rbp], 0 # i = 0
    jmp	.L2 # Переход к циклу. for
.L3:
    mov	eax, DWORD PTR -4[rbp] # Получение i.
    cdqe
    lea	rdx, 0[0+rax*4] #
    lea	rax, ARRAY_B[rip] # Получение адреса массива.
    mov	eax, DWORD PTR [rdx+rax] # Получение элемента массива.
    mov	esi, eax # Передача элемента массива в функцию printf.
    lea	rdi, .LC0[rip] # Передача формата "%d" в функцию printf.
    mov	eax, 0 # eax = 0
    call	printf@PLT # Вызов функции printf. printf("%d ", ARRAY_B[i])
    add	DWORD PTR -4[rbp], 1 # i++
.L2:
    mov	eax, DWORD PTR -4[rbp] # Загрузка i в eax
    cmp	eax, DWORD PTR -20[rbp] # Сравнение i и size
    jl	.L3 # Переход к циклу телу for если i < size
    nop
    nop
    leave # Конец функции
    ret

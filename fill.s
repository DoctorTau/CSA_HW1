	.file	"fill.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	InputArrayA 
	.type	InputArrayA, @function
InputArrayA:
	endbr64
	push	rbp # Начало функции
	mov	rbp, rsp
	sub	rsp, 32 # 
	mov	DWORD PTR -20[rbp], edi # Загрузка занчения size в -20[rbp]
	mov	DWORD PTR -4[rbp], 0 # int i = 0
	jmp	.L2 # Переход к циклу
.L3:
	lea	rax, -8[rbp] # Загрузка адреса массива в rax. rax = value
	mov	rsi, rax # Загрузка значения массива в rsi
	lea	rdi, .LC0[rip] # Значения формата "%d" в rdi
	mov	eax, 0 # eax = 0
	call	__isoc99_scanf@PLT # Вызов scanf. scanf("%d", &value)
	mov	eax, DWORD PTR -8[rbp] # Загрузка значения массива в eax
	mov	edx, DWORD PTR -4[rbp] # Загрузка значения i в edx
	movsx	rdx, edx # Загрузка значения i в edx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, ARRAY_A[rip]
	mov	DWORD PTR [rcx+rdx], eax
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp] # Загрузка значения i в eax
	cmp	eax, DWORD PTR -20[rbp] # Сравнение i и size
	jl	.L3 # Если i < size, то переход к циклу
	nop # Завершение функции
	nop #
	leave # Завершение
	ret # 

    .intel_syntax noprefix
    .text
    .comm	ARRAY_A,41940,32 #  Создание превого массива int ARRAY_A[10485]
    .comm	ARRAY_B,41940,32 # Создание второго массива int ARRAY_B[10485]
    .section	.rodata
.LC0:
    .string	"%d"
    .text
    .globl	main
    .type	main, @function
main:
    push	rbp # Начало функции main
    mov	rbp, rsp

    sub	rsp, 32 # Свиг rsp на 32
    mov	DWORD PTR -20[rbp], edi # Переменная argc
    mov	QWORD PTR -32[rbp], rsi # Переменная argv
    mov	r12d, 0 # Переменная new_size = 0
    lea	rax, -12[rbp] # Загрузка адреса переменной n в rax
    mov	rsi, rax # Загрузка адреса переменной n в rsi
    lea	rdi, .LC0[rip]  # Загрузка адреса переменной "%d"
    mov	eax, 0 # Загрузка 0 в eax
    call	__isoc99_scanf@PLT # Вызов scanf("%d", &n). Используются регистры rdi, rsi, rax
    mov	eax, DWORD PTR -12[rbp] # Загрузка адреса переменной n в eax
    mov	edi, eax # Загрузка адреса переменной n в edi
    call	InputArrayA@PLT # Вызов функции InputArrayA(n). Данные передаются через edi.
    mov	r13d, 0 # Переменная i = 0
    jmp	.L2 # Переход на метку .L2
.L4:
    mov	eax, r13d # Загрузка значения переменной i в eax
    cdqe #
    lea	rdx, 0[0+rax*4] # Загрузка адреса переменной ARRAY_A[i] в rdx
    lea	rax, ARRAY_A[rip] # Загрузка адреса переменной ARRAY_A в rax
    mov	eax, DWORD PTR [rdx+rax] # Загрузка значения переменной ARRAY_A[i] в eax
    and	eax, 1 # Побитовое И с 1. ARRAY_A[i] % 2
    test	eax, eax # Проверка на равенство 0
    jne	.L3 # Переход на метку .L3 если значение переменной ARRAY_A[i] нечетное ARRAY_A[i] % 2 == 0
    mov	eax, r13d # Загрузка значения переменной i в eax
    cdqe
    lea	rdx, 0[0+rax*4] # Загрузка адреса переменной ARRAY_A[i] в rdx
    lea	rax, ARRAY_A[rip] # Загрузка адреса переменной ARRAY_A в rax
    mov	eax, DWORD PTR [rdx+rax] # Загрузка значения переменной ARRAY_A[i] в eax
    test	eax, eax # Проверка на равенство нулю
    jns	.L3 # Переход на метку .L3 если значение переменной ARRAY_A[i] неотрицательное. ARRAY_A[i] >= 0
    add	r12d, 1 # Переменная new_size = new_size + 1. new_size++
.L3:
    add	r13d, 1 # Переменная i = i + 1. i++
.L2:
    mov	eax, DWORD PTR -12[rbp] # Загрузка адреса переменной n в eax
    cmp	r13d, eax # Сравнение i и n
    jl	.L4  # Переход на метку .L4 если i < n
    mov	eax, DWORD PTR -12[rbp] # Загрузка адреса переменной n в eax
    mov	edi, eax # Загрузка адреса переменной n в edi
    call	GenerateNewArray@PLT # Вызов функции GenerateNewArray(n). Передача параметров осуществляется через edi.
    mov	eax, r12d # Загрузка значения переменной new_size в eax
    mov	edi, eax # Загрузка значения переменной new_size в edi. Подготовка к вызову функции PrintArrayB
    call	PrintArrayB@PLT # Вызов функции PrintArrayB(new_size). Передача параметров осуществляется с помощью edi.
    mov	eax, 0 # Загрузка значения 0 в eax
    leave # Завершение функции main. return 0
    ret
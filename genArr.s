    .file	"genArr.c"
    .intel_syntax noprefix
    .text
    .globl	GenerateNewArray
    .type	GenerateNewArray, @function
GenerateNewArray:
    endbr64
    push	rbp # Начало функции
    mov	rbp, rsp
    mov	DWORD PTR -20[rbp], edi # Получение size
    mov	r14d, 0 # j = 0 ; Значение хранится в регистре r14d.
    mov	r15d, 0 # i = 0 ; Значение хранится в регистре r15d.
    jmp	.L2 # Переход к циклу for
.L4:
    mov	eax, r15d # Получение i
    cdqe
    lea	rdx, 0[0+rax*4]
    lea	rax, ARRAY_A[rip] # Получение адреса массива A
    mov	eax, DWORD PTR [rdx+rax] # Получение элемента массива A
    and	eax, 1 # Получение последнего бита элемента массива A
    test	eax, eax # Проверка на 0
    jne	.L3 # Переход при ARRAY_A[i] % 2 != 0
    mov	eax, r15d # Получение i
    cdqe
    lea	rdx, 0[0+rax*4]
    lea	rax, ARRAY_A[rip]
    mov	eax, DWORD PTR [rdx+rax]
    test	eax, eax # ARRAY_A[i] % 2 < 0
    jns	.L3 # Переход к если ARRAY_A >= 0
    mov	eax, r15d # Получение i
    cdqe
    lea	rdx, 0[0+rax*4] # Получение адреса элемента массива A
    lea	rax, ARRAY_A[rip]
    mov	eax, DWORD PTR [rdx+rax] # eax = ARRAY_A[i]
    mov	edx, r14d
    movsx	rdx, edx
    lea	rcx, 0[0+rdx*4]
    lea	rdx, ARRAY_B[rip]
    mov	DWORD PTR [rcx+rdx], eax # ARRAY_B[j] = ARRAY_A[i]
    add	r14d, 1 # j++
.L3:
    add	r15d, 1 # i++
.L2:
    mov	eax, r15d # Загрузка eax = i
    cmp	eax, DWORD PTR -20[rbp] # i < size
    jl	.L4 # Переход к телу цикла for
    nop
    nop
    pop	rbp # Возврат из функции
    ret

; nasm -f elf64 calculadora.asm; gcc -m64 -no-pie calculadora.o -o calculadora.x
extern printf
extern scanf

extern fopen
extern fprintf
extern fclose

section .data
	strControlePrintf : db "equação: ", 0
	strControle : db "%f %c %f", 0

	nomeArquivo : db "resultado.txt", 0
	modoLeituraArquivo : db "a", 0
	strControleArquivo : db "%lf %c %lf = %lf", 10, 0

section .bss
	operando1 : resd 1
	operacao  : resb 1
	operacaoArquivoSaida : resb 1
	operando2 : resd 1
	resultado : resd 1

	arquivo : resd 1

section .text
	global main

main:
	push rbp
	mov rbp, rsp

	xor rax, rax
	mov rdi, strControlePrintf
	call printf

	xor rax, rax
	mov rdi, strControle
	lea rsi, [operando1]
	lea rdx, [operacao]
	lea rcx, [operando2]
	call scanf

	; xmm0 = operando1
	; r8 = operacao
	; xmm1 = operando2
	; xmm2 = resultado

	mov r8, [operacao]

	cmp r8, 'a'
	movss xmm0, [operando1]
	movss xmm1, [operando2]
	call soma
	jmp modificaArquivo

	cmp r8, 's'
	movss xmm0, [operando1]
        movss xmm1, [operando2]
	call subtracao
	jmp modificaArquivo

	cmp r8, 'm'
	movss xmm0, [operando1]
        movss xmm1, [operando2]
	call multiplicacao
	jmp modificaArquivo

	cmp r8, 'd'
	movss xmm0, [operando1]
        movss xmm1, [operando2]	
	call divisao
	jmp modificaArquivo

	cmp r8, 'e'
	movss xmm0, [operando1]
        movss xmm1, [operando2]
	call exponenciacao
	jmp modificaArquivo

modificaArquivo:
	movss [resultado], xmm2
	xor rax, rax
	mov rdi, nomeArquivo
        mov rsi, modoLeituraArquivo
        call fopen
	mov [arquivo], rax ; o resultado de fopen está em rax

	mov rax, 2
	mov rdi, qword [arquivo]
	mov rsi, strControleArquivo
	cvtss2sd xmm0, [operando1]
	mov rdx, [operacaoArquivoSaida]
	cvtss2sd xmm1, [operando2]
	cvtss2sd xmm2, [resultado]
	call fprintf

	mov rdi, qword [arquivo]
	call fclose
	
fim:
	mov rsp, rbp
	pop rbp

	mov rax, 60
	mov rdi, 0
	syscall

soma:
	push rbp
	mov rbp, rsp

	mov r9b, "+"
	mov [operacaoArquivoSaida], r9b

	vaddss xmm2, xmm0, xmm1

	mov rsp, rbp
	pop rbp
	ret

subtracao:
        push rbp
        mov rbp, rsp
	
	mov r9b, "-"
	mov [operacaoArquivoSaida], r9b
        
	mov rsp, rbp
        pop rbp
        ret

multiplicacao:
        push rbp
        mov rbp, rsp

	mov r9b, "*"
	mov [operacaoArquivoSaida], r9b

        mov rsp, rbp
        pop rbp
        ret

divisao:
        push rbp
        mov rbp, rsp

	mov r9b, "/"
	mov [operacaoArquivoSaida], r9b

        mov rsp, rbp
        pop rbp
        ret

exponenciacao:
        push rbp
        mov rbp, rsp

	mov r9b, "^"
	mov [operacaoArquivoSaida], r9b

        mov rsp, rbp
        pop rbp
        ret

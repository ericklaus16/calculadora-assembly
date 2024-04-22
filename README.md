### Projeto de Assembly x86_64 para Operações com Ponto Flutuante
* Este projeto foi desenvolvido como parte de uma atividade acadêmica na Universidade Estadual do Oeste do Paraná (UNIOESTE) pelos acadêmicos Eric Klaus Brenner Melo e Santos e Ruan Rubino de Carvalho.

#### Descrição
* O objetivo deste projeto é criar um programa em Assembly x86_64 que permita a entrada de dois operandos sinalizados em ponto-flutuante de precisão simples e uma operação aritmética. O programa calculará o resultado da operação e o armazenará em um arquivo acumulativo.

#### Especificações
* Arquitetura: AMD/Intel x86_64
* Sintaxe: Intel
* Operações: Adição, Subtração, Multiplicação, Divisão e Exponenciação
* Entradas: Dois operandos e operador
* Saída: Resultado da operação em um arquivo resultado.txt

#### Funcionamento

##### Entrada de Operandos e Operação:
* O programa solicitará a entrada dos dois operandos em ponto-flutuante de precisão simples e a operação desejada (a, s, m, d, e) através de funções externas scanf.

##### Cálculo da Operação:
* Com base nos operandos e na operação, o programa executará a operação aritmética correspondente em ponto-flutuante.

##### Armazenamento do Resultado:
* O resultado da operação será armazenado em um arquivo acumulativo para registro e futuras consultas.

##### Encerramento:
* O programa encerrará a execução de forma adequada.

##### Como Executar
* Montagem e Ligação: nasm -f elf64 calculadora.asm; gcc -m64 -no-pie calculadora.o -o calculadora.x
* Execução: ./calculadora.x

##### Observações
* Casos não cobertos neste documento foram decididos pelos acadêmicos durante o desenvolvimento do projeto.
* O código fonte em Assembly deve ser de até 400 linhas de código, conforme especificações.
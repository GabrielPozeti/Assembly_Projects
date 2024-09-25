TITLE contarAsteriscos
.MODEL SMALL
.STACK 100h

.DATA
    MSG DB 13, 10, 'Por favor, digite quantos caracteres quiser. Pressione ENTER para finalizar: $'
    MSG2 DB 13, 10, 'Aqui estao os caracteres como asterisco: $'
    ASTERISCO DB '*'     


.CODE
MAIN PROC
    ; Inicializa o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Exibe a mensagem inicial
    MOV AH, 9
    LEA DX, MSG
    INT 21h

    
    MOV CL, 0           ; Zera o contador no registrador CL

LER_CARACTERES:
   
    MOV AH, 1 ; Lê o caractere do teclado
    INT 21h

    CMP AL, 13 ; Verifica se o caractere é o ENTER (código ASCII 13)
    JE IMPRIMIR_RESULTADO ; Pula para imprimir_resultado se for

    
    INC CL ; Incrementa em 1 o contador de caracteres no registrador CL

    ; Continua lendo caracteres
    JMP LER_CARACTERES

IMPRIMIR_RESULTADO:
    
    ; Exibe a mensagem de número de caracteres digitados
    MOV AH, 9
    LEA DX, MSG2
    INT 21h

IMPRIMIR_ASTERISCOS:

    ; Verifica se ainda há caracteres a serem impressos
    CMP CL, 0
    JE FINALIZAR

    ; Exibe um asterisco
    MOV AH, 2
    MOV DL, ASTERISCO
    INT 21h


    DEC CL    ; Decrementa o contador CL em 1

    
    JMP IMPRIMIR_ASTERISCOS ; Repete a exibição de asteriscos

FINALIZAR:
    ; Finaliza o programa
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN

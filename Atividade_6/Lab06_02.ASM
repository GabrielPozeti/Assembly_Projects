TITLE contarAsteriscos
.MODEL SMALL
.STACK 100h

.DATA
    MSG DB 13, 10, 'Por favor, digite quantos caracteres quiser. Pressione ENTER para finalizar: $'
    MSG2 DB 13, 10, 'Aqui estao os caracteres como asterisco: $'
    ASTERISCO DB '*'      ; Caractere asterisco a ser exibido
    ENTER DB 13           ; Código ASCII para Enter (Carriage Return)

.CODE
MAIN PROC
    ; Inicializa o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Exibe a mensagem inicial
    MOV AH, 9
    LEA DX, MSG
    INT 21h

    ; Zera o contador no registrador CL
    MOV CL, 0

LER_CARACTERES:
    ; Lê o caractere do teclado
    MOV AH, 1
    INT 21h

    ; Verifica se o caractere é o ENTER (código ASCII 13)
    CMP AL, ENTER
    JE IMPRIMIR_RESULTADO  ; Pula para impressão de asteriscos se for ENTER

    ; Incrementa o contador de caracteres no registrador CL
    INC CL

    ; Continua lendo caracteres
    JMP LER_CARACTERES

IMPRIMIR_RESULTADO:
    ; Exibe a mensagem informando a exibição dos asteriscos
    MOV AH, 9
    LEA DX, MSG2
    INT 21h

IMPRIMIR_ASTERISCOS:
    ; Verifica se o número de caracteres no registrador CL é 0
    CMP CL, 0
    JE FINALIZAR           ; Se CL = 0, finaliza o programa

    ; Exibe um asterisco
    MOV AH, 2
    MOV DL, ASTERISCO
    INT 21h

    ; Decrementa o contador CL em 1
    DEC CL

    ; Repete a exibição de asteriscos
    JMP IMPRIMIR_ASTERISCOS

FINALIZAR:
    ; Finaliza o programa
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN

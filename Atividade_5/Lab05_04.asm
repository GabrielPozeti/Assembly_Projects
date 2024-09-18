TITLE loopDeLetrasEmLinhas
.MODEL SMALL
.STACK 100
.CODE
MAIN PROC
    
    MOV DL, 97 ; define o que será impresso (a)
    MOV CX, 26 ; define o número de repetições
    MOV BL, 4 ; define o numero de repeticoes do loop do espaco
    MOV BH, 10 ; define o espaco a ser dado 

    MOV AH, 2

minuscula: ; loop, que imprimirá as letras minusculas. uma ao lado da outra, ate no maximo 4 por linha.
    
    INT 21h ; imprime a letra
    INC DL ; incrementa em 1 o dl, indo para a proxima letra
    DEC BL ; decrementa bl em 1
    JNZ pular ; caso bl seja 0, pula para a instrucao pular

    XCHG DL, BH ; troca o valor de dl (letra atual) pelo de bh (espaço)
    INT 21H ; imprime o espaço
    XCHG DL,BH ; destroca
    MOV BL, 4 ; reinicia o contador para o espaço 

PULAR:    
    LOOP minuscula
   
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN

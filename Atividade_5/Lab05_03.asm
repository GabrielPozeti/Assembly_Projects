TITLE loopDeLetras
.MODEL SMALL
.STACK 100
.CODE
MAIN PROC
    
    MOV DL, 65 ; define o que será impresso (A)
    MOV CX, 26 ; define o número de repetições
    MOV AH, 2

maiuscula: ; primeiro loop, que imprimirá as letras maiusculas. uma ao lado da outra
    INT 21h; imprime
    CMP CX, 0 ; compara o contador com 0
    INC DL; incrementa em 1 o dx, indo para a proxima letra
    LOOP maiuscula
    
   

 MOV CX, 26  ; Reinicia o contador do loop para 26 linhas
 MOV DL, 97 ; define o que será impresso (a)


minuscula: ; segundo loop, que imprimirá as letras minusculas. uma ao lado da outra
    INT 21h ; imprime
    CMP CX, 0 ; compara o contador com 0
    INC DL; incrementa em 1 o dx, indo para a proxima letra
    LOOP minuscula

    FIM: ;finaliza o programa
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN

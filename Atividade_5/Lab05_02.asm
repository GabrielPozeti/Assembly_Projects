TITLE loopDeAsteriscos 
.MODEL SMALL
.STACK 100
.CODE
MAIN PROC
    
    MOV DL, '*' ; define o que será impresso
    MOV CX, 50 ; define o número de repetições
    MOV AH, 2

alinhado: ; primeiro loop, que imprimirá os '*' um ao lado do outro
    INT 21h
    CMP CX, 0 ; compara o contador com 0
    LOOP alinhado
    
   

 MOV CX, 50  ; Reinicia o contador do loop para 50 linhas

umPorLinha:

   INT 21h ;imprime o "*"
   MOV DL, 10 ; adiciona o valor da instrução de backspace ao DX
   INT 21h ; imprime o backspace
   MOV DL, '*'; retorna o valor de "*" para que possa ser impresso novamente no topo do loop
    CMP CX, 0; compara o contador com 0
    LOOP umPorLinha

    FIM: ;finaliza o programa
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN

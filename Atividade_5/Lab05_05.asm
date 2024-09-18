TITLE loopDeSomatorio
.MODEL SMALL
.STACK 100h

.DATA
    msg1    DB 'Digite um numero (0-9): $'
    msg2    DB 'A somatoria e: $'
    linha   DB 13, 10, '$'          ; Nova linha (carriage return e line feed)
    total   DW 0                    ; Inicia a somatória com 0

.CODE
MAIN PROC
    ; Inicializa os dados
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 5                         ; define para 5 o numero de repeticoes

entrada:
    ; Exibir a mensagem para o usuário
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    ; Lê o número inserido pelo usuário
    MOV AH, 01H                       ; Função de leitura de caractere de entrada
    INT 21H
    SUB AL, '0'                       ; Converter o caractere ASCII para valor numérico
    MOV BL, AL                        ; Armazena o número lido em BL

    ; Adiciona o número à soma
    ADD total, BX                     ; Soma o número à variável total

    ;Adiciona o espaço/linha após cada pedido/entrada de dados do usuario 
    MOV AH, 09H         
    LEA DX, linha       
    INT 21H

    LOOP entrada                   ; Repete até que CX seja igual a 0

    ; Exibir a mensagem de saída
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    ; Converte a soma para ASCII
    MOV AX, total                     ; Move o valor da soma para AX
    ADD AX, '0'                       ; Converte para ASCII
    MOV DL, AL                        ; Coloca o caractere (somado) ASCII em DL

    ; Exibe a soma
    MOV AH, 02H
    INT 21H

    ; Encerra o programa
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

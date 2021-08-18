DATA SEGMENT
        DEN DB 03H
DATA ENDS

CODE SEGMENT
        ASSUME DS:DATA, CS:CODE
START:
        MOV AX,DATA
        MOV DS,AX
        LEA SI,DEN
        MOV CX,08H
        MOV AX,01H
        MOV BX,AX
LOOP1:
        INC BX
        MUL BX
        CMP BX,CX
        JNZ LOOP1
        SUB CX,[SI]
        MOV BX,00H
        INC SI
        MOV [SI],AX
        MOV AX,01H
LOOP2:
        INC BX
        MUL BX
        CMP CX,BX
        JNZ LOOP2
        MOV BX,AX
        MOV AX,[SI]
        DIV BX
        HLT
CODE ENDS
END START

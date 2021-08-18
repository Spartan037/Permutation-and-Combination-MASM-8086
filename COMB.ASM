DATA SEGMENT
        DEN DB 02H
DATA ENDS

CODE SEGMENT
        ASSUME DS:DATA, CS:CODE
START:
        MOV AX,DATA
        MOV DS,AX
        LEA SI,DEN
        MOV CX,05H
        MOV AX,01H
        MOV BX,AX
LOOP1:
        INC BX
        MUL BX
        CMP BX,CX
	JNZ LOOP1
	MOV CX,[SI]
	MOV BX,00H
        INC SI
	MOV [SI],AX
        MOV AX,01H
LOOP2:
        INC BX
        MUL BX
        CMP BX,CX
        JNZ LOOP2
	MOV BX,AX
	MOV AX,[SI]
	DIV BX
	INC SI
	MOV [SI],AX
	MOV BX,00H
	MOV AX,01H
	MOV CX,03H
LOOP3:
        INC BX
        MUL BX
        CMP CX,BX
        JNZ LOOP3
        MOV BX,AX
        MOV AX,[SI]
	DIV BX
	HLT
CODE ENDS
END START

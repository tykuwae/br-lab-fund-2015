;***** variaveis para PACK() *****
packA   <
packB   < 
PACK    <

;***** variaveis para UNPACK() *****
UNPACK  <
unpackA  <
unpackB  <

;***** variaveis para STRCMP() *****
STRCMP    <
AmEnd1    <
AmEnd2    <

;***** variaveis para MEMCOPY() *****
MEMCOPY <
numeroDeBytes <
origem  <
destino <

;***** variaveis para GETLINEF() *****

GETLINEF <
GL_END <
GL_UL <
GL_BUF <

&	/0000
MAIN	JP	START

VAL_UL	K	/0001		; UL do arquivo
VAL_BUF	K	=10			; Tamanho do buffer
BUFFER	$	=10			; Buffer: algumas posições reservadas
  

START	LV	BUFFER 		; Param 1: endereço do buffer
		MM	GL_END
		LD	VAL_UL		; Param 2: unidade lógica
		MM	GL_UL
		LD	VAL_BUF		; Param 3: tamanho do buffer
		MM	GL_BUF
		SC	GETLINEF	; Chama subrotina
    JP  position
    K   /0001  
position OS /01FC
END		HM	END			; fim do programa

# MAIN

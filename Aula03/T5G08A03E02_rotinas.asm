;***** constantes *****
h0001 <
h0002 <
h0100 <
hFF00 <

;***** variaveis para PACK() *****
PACK    >
packA   <
packB   <  

; ;***** variaveis para UNPACK() *****
; UNPACK  >
; unpackA <
; unpackB <
; temp <

; ;***** variaveis para STRCMP() *****
; STRCMP    >
; count     <  ;Resposta
; string1   <
; string2   <
; A1        <
; B1        <
; A10       <
; B10       <
; AmLoad    <
; AmEnd1    <
; AmEnd2    <

; ;***** variaveis para ifZAddCount() *****
; IfZAddCount >
; count <

;**************************** PACK() ***************************************;
PACK      $ /0001
          LD packA ;Carrega no acc <- packA
          *  h0100    ; multiplca por h0100
          +  packB
          RS PACK

; ;*************************** UNPACK() **************************************;
; UNPACK    $  /0001
;           MM temp   ;guarda no temp
;           *  h0100    ;shift de 2 bytes para esquerda
;           /  h0100    ;shift de 2 bytes para direita
;           JN casoNeg ;caso negativo jmp para casoNEG
;           MM unpackB
;           JP parteA ;continua para pegar a primeira parte da palavra
; casoNeg   - hFF00
;           MM unpackB
; parteA    LD temp
;           - unpackB
;           / h0100
;           JN casoNeg2 ;caso negativo
;           MM unpackA
;           JP fimSubRotina
; casoNeg2  - hFF00
;           MM unpackA
; fimSubRotina  RS UNPACK

; ;************************ IfZAddCount() ************************************;
; IfZAddCount       $ /0001
;                JZ contAddCount ;Se nao for igual a zero, vai pra fimAddCount
;                JP endSTRCMP
; fimAddCount    RS IfZAddCount
; contAddCount   LD count
;                + h0001
;                MM count
;                JP fimAddCount

; ;**************************** STRCMP() ************************************;

; STRCMP    $  /0001
;           LD AmEnd1 ;Pega primeiro elemento
;           +  AmLoad ;soma com instrução de colocar no acc
;           MM next1
; next1     $  /0001
;           SC UNPACK   ;chama surotina unpack()
;           LD unpackA
;           MM A1
;           LD unpackB
;           MM B1

;           LD AmEnd2 ;Carreg primeira palavra da string2 no acc
;           +  AmLoad ;soma com instrução de colocar no acc
;           MM next2
; next2     $  /0001
;           SC UNPACK   ;chama surotina unpack()
;           LD unpackA
;           MM A10
;           LD unpackB
;           MM B10
          
;           ;compara A1 com A10
;           LD A10
;           JZ endSTRCMP
;           LD A1
;           JZ endSTRCMP
;           - A10
;           SC IfZAddCount
;           ;;Verifica B1 e B10
;           LD B10
;           JZ endSTRCMP
;           LD B1
;           JZ endSTRCMP
;           - B10
;           SC IfZAddCount

;           ;Auto modificação
;           LD AmEnd1
;           +  h0002
;           MM AmEnd1

;           LD AmEnd2
;           +  h0002
;           MM AmEnd2

;           JP inicio

; endSTRCMP      LD count 
;                RS STRCMP


# PACK


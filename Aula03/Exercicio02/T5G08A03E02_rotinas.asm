;***** constantes *****
h0000 <
h0001 <
h0002 <
h0100 <
hFF00 <
hFFFF <
AmLoad <
AmDownload <

;***** variaveis para PACK() *****
PACK    >
packA   <
packB   <  

;***** variaveis para UNPACK() *****
UNPACK  >
unpackA <
unpackB <
temp <

& /0000
;**************************** PACK() ***************************************;
PACK      $ /0001
          LD packA ;Carrega no acc <- packA
          *  h0100    ; multiplca por h0100
          +  packB
          RS PACK

;*************************** UNPACK() **************************************;
UNPACK    $  /0001
          MM temp   ;guarda no temp
          *  h0100    ;shift de 2 bytes para esquerda
          /  h0100    ;shift de 2 bytes para direita
          JN casoNeg ;caso negativo jmp para casoNEG
          MM unpackB
          JP parteA ;continua para pegar a primeira parte da palavra
casoNeg   - hFF00
          MM unpackB
parteA    LD temp
          - unpackB
          / h0100
          JN casoNeg2 ;caso negativo
          MM unpackA
          JP fimSubRotina
casoNeg2  - hFF00
          MM unpackA
fimSubRotina  RS UNPACK

# PACK


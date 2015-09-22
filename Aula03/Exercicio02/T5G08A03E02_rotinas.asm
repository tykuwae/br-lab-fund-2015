;***** constantes *****
h0000 <
h0001 <
h0002 <
h0010 <
h000A <
h0030 <
h0037 <
h003A <
h0041 <
h0047 <
h1000 <
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

;***** variaveis para CHTOI()  *****
CHTOI >
chtoiA  <
chtoiB  <
varNumberOrLetter <
chtoiWordA <
chtoiWordB <
chtoiWordC <
chtoiWordD <

;***** variaveis para ITOCH() *****
  ITOCH >
  RES1       <
  RES2       <
  A1         <
  A2         <
  B1         <
  B2         <


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

;*************************** CHTOI() **************************************;

CHTOI $ /0001
          LD  chtoiA
          SC UNPACK
          LD unpackA
          SC NumberOrLetter
          JN endChtoi
          * h1000
          MM chtoiWordA
          
;Proxima palavra
          LD unpackB
          SC NumberOrLetter
          JN endChtoi
          * h0100
          MM chtoiWordB
;Proxima palavra
            LD chtoiB
            SC UNPACK
            LD unpackA
            SC NumberOrLetter
            JN endChtoi
            * h0010
            MM chtoiWordC
           
;Proxima palavra
            LD unpackB
            SC NumberOrLetter
            JN endChtoi
            MM chtoiWordD
;Agrupar os nibbles
addAll      LD chtoiWordA
            + chtoiWordB
            + chtoiWordC
            + chtoiWordD
endChtoi    RS CHTOI


NumberOrLetter $ /0001
          MM varNumberOrLetter
          - h0047
          JN continua1
          JP errorChtoi
continua1 LD varNumberOrLetter
          - h003A
          JN isNumber
          LD varNumberOrLetter
          - h0037
          JP EndNumberOrLetter
isNumber  LD varNumberOrLetter
          - h0030
          JP EndNumberOrLetter
errorChtoi        LD hFFFF
EndNumberOrLetter RS NumberOrLetter


;************ ITOCH() *************


ITOCH  $ /0001
        SC UNPACK 
        LD unpackA
        MM A1
        LD unpackB
        MM B1
        LD A1
        * h0010
        SC UNPACK
        LD unpackA
        MM A1
        LD unpackB
        / h0010
        MM A2
        LD B1
        * h0010
        SC UNPACK
        LD unpackA
        MM B1
        LD unpackB
        / h0010
        MM B2
        ;apos essa etapa, as quatro secoes do numero estao separadas (ou deveriam estar, tipo 0001, 0002....)

        LD A1
        SC CHKNUM
        * h0100
        MM RES1
        LD A2
        SC CHKNUM
        + RES1
        MM RES1

        LD B1
        SC CHKNUM
        * h0100
        MM RES2
        LD B2
        SC CHKNUM
        + RES2
        MM RES2

        RS ITOCH
        ;Fim de rotina.


CHKNUM  $ /0001
        - h000A
        JN EHNUM
        + h0041
ENDCHK  RS CHKNUM

EHNUM   + h000A
        + h0030
        JP ENDCHK

# PACK


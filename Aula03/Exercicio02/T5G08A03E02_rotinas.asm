;***** constantes *****
h0000 <
h0001 <
h0002 <
h0010 <
h0030 <
h0037 <
h003A <
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

;***** variaveis para CHTOI() TODO extrair *****
CHTOI >
chtoiA  <
chtoiB  <
chtoiWordA <
chtoiWordB <
chtoiWordC <
chtoiWordD <

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
          MM chtoiWordA
          - h0047
          JN continua1
          JP errorChtoi
continua1 LD chtoiWordA
          - h003A
          JN isNumber
          LD chtoiWordA
          - h0037
shift     * h1000
          MM chtoiWordA
          JP nextWord
isNumber  LD chtoiWordA
          - h0030
          JP shift
;Proxima palavra
nextWord  LD unpackB
            MM chtoiWordB
            - h0047
            JN continua2
            JP errorChtoi
continua2   LD chtoiWordB
            - h003A
            JN isNumber2
            LD chtoiWordB
            - h0037
shift2     * h0100
            MM chtoiWordB
            JP nextWord2
isNumber2  LD chtoiWordB
            - h0030
            JP shift2
;Proxima palavra
 nextWord2  LD chtoiB
            SC UNPACK
            LD unpackA
            MM chtoiWordC
            - h0047
            JN continua3
            JP errorChtoi
continua3   LD chtoiWordC
            - h003A
            JN isNumber3
            LD chtoiWordC
            - h0037
shift3      * h0010
            MM chtoiWordC
            JP nextWord3
isNumber3   LD chtoiWordC
            - h0030
            JP shift3
;Proxima palavra
nextWord3   LD unpackB
            MM chtoiWordD
            - h0047
            JN continua4
            JP errorChtoi
continua4   LD chtoiWordD
            - h003A
            JN isNumber4
            LD chtoiWordD
            - h0037
shift4      MM chtoiWordD
            JP addAll
isNumber4   LD chtoiWordD
            - h0030
            JP shift4
;Agrupar os nibbles
addAll      LD chtoiWordA
            + chtoiWordB
            + chtoiWordC
            + chtoiWordD
endChtoi    RS CHTOI

errorChtoi  LD hFFFF
            JP endChtoi
  
# PACK


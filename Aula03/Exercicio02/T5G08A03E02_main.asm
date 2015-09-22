;***** variaveis para PACK() *****
packA   <
packB   < 
PACK    <

;***** variaveis para UNPACK() *****
UNPACK  <
unpackA  <
unpackB  <



& /0000 ;ANTES ERA @ /0000. SUBSTITUÍDO POR & /0000 APÓS COMENTÁRIO EM AULA SOBRE BUG.

MAIN  JP  INICIO

chtoiA  K   'FF ; /3132
chtoiB  K   'FF ; /3334
;***** constants extrair****;
h0030 K /0030
h0037 K /0037 
h003A K /003A ; Constante correpondente a um numero (maiores 3A que  nao sao numeros)
h0047 K /0047 ; Constnte que verifica se eh uma letra maior que F
h1000 K /1000
h0100 K /0100
h0010 K /0010
hFFFF K /FFFF

;***** variaveis para CHTOI() TODO extrair *****
chtoiWordA $ /0001 ;/0031
chtoiWordB $ /0001 ;/0032
chtoiWordC $ /0001 ;/0033
chtoiWordD $ /0001 ;/0034
chtoiFINAL $ /0001
;******INICIO DO PROGRAMA******
;Utilizaremos MEMCOPY para passar a string declarado no main para seu devido lugar
INICIO  SC  CHTOI
        MM chtoiFINAL
FIM   HM  FIM

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
  



# MAIN  
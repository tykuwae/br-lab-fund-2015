;***** constantes *****
h0000 >
h0001 >
h0002 >
h0100 >
hFF00 >
hFFFF >
AmLoad >
AmDownload >

;***** variaveis para PACK() *****
packA   >
packB   > 


;***** variaveis para UNPACK() *****
unpackA >
unpackB >
temp >

;***** variaveis para STRCMP() *****
count     >  ;Resposta
string1   >
string2   >
A1        >
B1        >
A10       >
B10       >
AmEnd1    >
AmEnd2    >

;***** variaveis para MEMCOPY() *****
numeroDeBytes >
origem  >
destino >
countMemCopy    >
moveMemCopy     >


& /0000
;***** constantes *****
h0000 K /0000
h0001 K /0001 
h0002 K /0002  
h0100 K /0100  
hFF00 K /FF00
AmLoad    K /8000
AmDownload k /9000

;***** variaveis para PACK() *****
packA $ /0001 ;entrada 1 de PACK   
packB $ /0001 ;entrada 2 de PACK        

;***** variaveis para UNPACK() *****
unpackA $ /0001
unpackB $ /0001
temp $ /0001

;***** variaveis para STRCMP() *****
string1   $ /0008
string2   $ /0008
count     $ /0001  ;Resposta
A1        $ /0001
B1        $ /0001
A10       $ /0001
B10       $ /0001
AmEnd1    K string1
AmEnd2    K string2

;***** variaveis para MEMCOPY() *****
numeroDeBytes $ /0001
origem  $ /0001
destino $ /0001
countMemCopy    $ /0001
moveMemCopy     $ /0001

# VARIAVEIS
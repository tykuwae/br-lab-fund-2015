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


& /0000 ;ANTES ERA @ /0000. SUBSTITUÍDO POR & /0000 APÓS COMENTÁRIO EM AULA SOBRE BUG.

MAIN  JP  INICIO
    varPackA  K   /0010
    varPackB  K   /0064
    varPackAB $  /0001

    varUnpackAB K /1234
    varUnpackA  $  /0001
    varUnpackB  $  /0001

    varString1   K  'va ;E
              K  'ic ;10
              K  'oa ;12
              K  /6600 ;14
              K  /0000 ;16
              K  /0000 ;18
              K  /0000 ;1A
              K  /0000 ;1C
    varString2   K  'va 
              K  'ic
              K  'om
              K  /6600
              K  /0000
              K  /0000
              K  /0000
              K  /0000
    varStrComp $ /0001

    varNumeroDeBytes K /0008
    varEnd1    K varString1
    varEnd2    K varString2

;******INICIO DO PROGRAMA******
;Utilizaremos MEMCOPY para passar a string declarado no main para seu devido lugar
INICIO  LD  varNumeroDeBytes
        MM  numeroDeBytes
        LD  varEnd1
        MM origem
        LD AmEnd1
        MM destino
        SC  MEMCOPY
        ;Carregou primeira string
        LD  varNumeroDeBytes
        MM  numeroDeBytes
        LD  varEnd2
        MM origem
        LD AmEnd2
        MM destino
        SC  MEMCOPY
        ;Carregou segunda string

        SC STRCMP
        MM varStrComp

        LD  varPackA
        MM  packA
        LD  varPackB
        MM  packB
        SC  PACK
        MM  varPackAB

        LD  varUnpackAB
        SC  UNPACK
        LD  unpackA
        MM varUnpackA
        LD  unpackB
        MM varUnpackB

FIM   HM  FIM

# MAIN  
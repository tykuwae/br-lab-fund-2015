packA   <
packB   < 
PACK    <
& /0000 ;ANTES ERA @ /0000. SUBSTITUÍDO POR & /0000 APÓS COMENTÁRIO EM AULA SOBRE BUG.

MAIN  JP  INICIO
    A K   /0010
    B K   /0064
    SAIDA $ /0001

INICIO  LD  A
    MM  packA
    LD  B
    MM  packB
    SC  PACK
    MM  SAIDA
FIM   HM  FIM

# MAIN  
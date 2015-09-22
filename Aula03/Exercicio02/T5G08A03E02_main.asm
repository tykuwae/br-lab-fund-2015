;***** variaveis para PACK() *****
packA   <
packB   < 
PACK    <

;***** variaveis para UNPACK() *****
UNPACK  <
unpackA  <
unpackB  <

;***** variaveis para CHTOI() TODO extrair *****
CHTOI <
chtoiA  <
chtoiB  <

& /0000 ;ANTES ERA @ /0000. SUBSTITUÍDO POR & /0000 APÓS COMENTÁRIO EM AULA SOBRE BUG.


MAIN  JP  INICIO
  ; varChtoiA K 'FA
  ; varChtoiB K 'FA
  RES1       $ /0001
  RES2       $ /0001
  stringTest K /1234
  h0010      K /0010
  h000A      K /000A
  h0037      K /0037
  h0030      K /0030
  h0100      k /0100
  varChtoiAB $ /0001
  A1         $ /0001
  A2         $ /0001
  B1         $ /0001
  B2         $ /0001

;******INICIO DO PROGRAMA******
;Utilizaremos MEMCOPY para passar a string declarado no main para seu devido lugar
INICIO    LD stringTest
          SC ICHTOI
FIM   HM  FIM


ICHTOI  $ /0001
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

        RS ICHTOI
        ;Fim de rotina.






CHKNUM  $ /0001
        - h000A
        JN EHNUM
        + h0037
ENDCHK  RS CHKNUM

EHNUM   + h000A
        + h0030
        JP ENDCHK

# MAIN  
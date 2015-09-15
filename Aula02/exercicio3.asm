@ /0000
main JP inicio
numeroDeBytes K /0003
origem  K /0008    ;ponteiro do origem
destino K /0010    ;ponteiro do destino
;Memoria reservada para os bytes
        K /0001
        K /0002
        K /0003
        K /0004
        K /ffff
        K /ffff
        K /ffff
        K /ffff
memDest $ /0010

;variaveis do programa
contador                $ /0001
conteudoImpar           $ /0001
conteudoSendoMovido     $ /0001
EndSendoMovido          $ /0001
resultado               $ /0001

;variaveis da funcao UNPACK
temp      $  /0001
sUnpackA  $  /0001 
sUnpackB  $  /0001

;instruções auto-modificação
AmLoad K /8000
AmDownload k /9000

;Constants
um        K  /0001
zero      K  /0000
fs        K  /ffff
dois      K  /0002
cemH      K  /0100
dezH      K  /0010
corr      K  /FF00

inicio    SC MEMCOPY
fim       HM fim

MEMCOPY   $ /0001
          LD numeroDeBytes
loop      MM contador
          LD contador
          - dois
          MM contador
          LD AmLoad
          + origem
          MM proxInstr
proxInstr $ /0001
          MM conteudoSendoMovido
          LD contador
          JN unpackUmByte
          LD AmDownload
          + destino
          MM proxInstr2
          LD conteudoSendoMovido ;conteudo
proxInstr2 $ /0001
          ;Atualiza auto-modificação
          LD origem 
          + dois
          MM origem
          LD destino
          + dois
          MM destino
          ;verificar numero par de bytes
          LD contador
          + dois
          JZ endMEMCOPY
          - dois
          JP loop

unpackUmByte  LD conteudoSendoMovido
              SC UNPACK
              LD sUnpackA
              * cemH
              MM conteudoImpar
              LD AmDownload ;9000
              + destino ;0010
              MM proxInstr3
              LD conteudoImpar ;conteudo
proxInstr3    $ /0001
              JP endMEMCOPY

endMEMCOPY    RS MEMCOPY


UNPACK    $  /0001
          MM temp   ;guarda no temp
          *  cemH    ;shift de 2 bytes para esquerda
          /  cemH    ;shift de 2 bytes para direita
          JN casoNeg ;caso negativo jmp para casoNEG
          MM sUnpackB
          JP parteA ;continua para pegar a primeira parte da palavra
casoNeg   - corr
          MM sUnpackB
parteA    LD temp
          - sUnpackB
          / cemH
          JN casoNeg2 ;caso negativo
          MM sUnpackA
          JP fimSubRotina
casoNeg2  - corr
          MM sUnpackA
fimSubRotina RS UNPACK


# main
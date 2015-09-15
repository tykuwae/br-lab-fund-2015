@ /0000
main JP inicio
numeroDeBytes K /0006
origem  K /0008    ;ponteiro do origem
destino K /0016    ;ponteiro do destino

        K /81A0
        K /151C
        K /B2AA  
memDest $ /0022

;variaveis do programa
contador                $ /0001
conteudoImpar           $ /0001
conteudoSendoMovido     $ /0001
EndSendoMovido          $ /0001

;variaveis da funcao UNPACK
temp      $  /0001
sUnpackA  $  /0001 
sUnpackB  $  /0001

;instruções auto-modificação
AmLoad K /8000
AmDownload k /9000

;Constants
um        K  /0001
dois      K  /0002
cemH      K  /0100
dezH      K  /0010
corr      K  /FF00

inicio    LD numeroDeBytes
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
          LD AmDownload ;9000
          + destino ;0010
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
          JZ fim
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
              JP fim

fim    HM fim

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
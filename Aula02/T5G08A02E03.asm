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
conteudoSendoMovido     $ /0001

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
endFinalDaMemDisponivel      K  /0028
corr      K  /FF00


; ***** INICIO DO PROGRAMA ***** ;
inicio    SC MEMCOPY
fim       HM fim
; ***** FIM DO PROGRAMA ***** ;


; *************** INICIO DAS SUBROTINAS **************** ;

; *** MEMCOPY() *** ;
MEMCOPY   $ /0001
          LD endFinalDaMemDisponivel
          - destino
          / dois
          - numeroDeBytes
          JN endMEMCOPYfail
          LD numeroDeBytes
          JZ endMEMCOPYfail
loop      MM contador
          LD contador
          - um
          MM contador
          LD AmLoad
          + origem
          MM proxInstr
proxInstr $ /0001
          MM conteudoSendoMovido
          LD contador
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
          JZ endMEMCOPYsuccess
          JP loop

endMEMCOPYfail    LD  fs
                  RS  MEMCOPY

endMEMCOPYsuccess   LD zero    
                    RS MEMCOPY
; *** end MEMCOPY() *** ;


; *** UNPACK() *** ;
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
; *** end UNPACK() *** ;

# main
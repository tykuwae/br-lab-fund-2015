@ /0000             ;Inicio do programa
main  JP  inicio    ;Jump para o inicio do programa
entrada   K  /fa21  ;Entrada 
saidaA    $  /0001  ;Saida A
saidaB    $  /0001  ;Saida B
cem       K  /0100  ;100h constante
corr      K  /FF00  ;FF00h constante de correção
temp      $  /0001  ;temp        
inicio    LD entrada
          SC UNPACK
fim       HM fim
UNPACK    $  /0001
          MM temp   ;guarda no temp
          *  cem    ;shift de 2 bytes para esquerda
          /  cem    ;shift de 2 bytes para direita
          JN casoNeg ;caso negativo jmp para casoNEG
          MM saidaB
          JP parteA ;continua para pegar a primeira parte da palavra
casoNeg   - corr
          MM saidaB
parteA    LD temp
          - saidaB
          / cem
          JN casoNeg2 ;caso negativo
          MM saidaA
          JP fimSubRotina
casoNeg2  - corr
          MM saidaA
fimSubRotina  RS UNPACK
# main 

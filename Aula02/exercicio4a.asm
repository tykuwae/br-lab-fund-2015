@ /0000             ;Inicio do programa
main  JP  inicio    ;Jump para o inicio do programa
resposta  $  /0001  ;Resposta
string1   K  'va
          K  'ic
          K  'om
          K  'fe
          K  /0000
          K  /0000
          K  /0000
          K  /0000
string2   K  'va
          K  'ic
          K  'oa
          K  'fe
          K  /0000
          K  /0000
          K  /0000
          K  /0000 
A1        $  /0001 ;24
B1        $  /0001 ;26       
A10       $  /0001
B10       $  /0001
temp      $  /0001
sUnpackA  $  /0001  ;2E
sUnpackB  $  /0001  ;30   
count     $  /0001 

;Constants
cemH      K  /0100
dezH      K  /0010
corr      K  /FF00

inicio    LD string1 ;Carreg primeira palavra da string1 no acc
          JZ fim     ;se for 0, fim
          SC UNPACK   ;chama surotina unpack()
          LD sUnpackA
          MM A1
          LD sUnpackB
          MM B1




fim       HM fim

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

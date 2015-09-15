@ /0000             ;Inicio do programa
main  JP  inicio    ;Jump para o inicio do programa
count  $  /0001  ;Resposta
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
;variaveis da funcao UNPACK
temp      $  /0001
sUnpackA  $  /0001  ;2E
sUnpackB  $  /0001  ;30

;Contador do pograma principal   
count2    $  /0001 

;Constants
um        K  /0001
dois      K  /0002
cemH      K  /0100
dezH      K  /0010
corr      K  /FF00

;auto-modificação
AmLoad    K  /8000
AmEnd1    K  string1
AmEnd2    K  string2 

    
inicio    LD AmEnd1 ;Pega primeiro elemento
          +  AmLoad ;soma com instrução de colocar no acc
          MM next1
next1     $  /0001
          SC UNPACK   ;chama surotina unpack()
          LD sUnpackA
          MM A1
          LD sUnpackB
          MM B1

          LD AmEnd2 ;Carreg primeira palavra da string2 no acc
          +  AmLoad ;soma com instrução de colocar no acc
          MM next2
next2     $  /0001
          SC UNPACK   ;chama surotina unpack()
          LD sUnpackA
          MM A10
          LD sUnpackB
          MM B10
          
          ;compara A1 com A10
          LD A10
          JZ fim
          LD A1
          JZ fim
          - A10
          SC IfZAddCount
          ;;Verifica B1 e B10
          LD B10
          JZ fim
          LD B1
          JZ fim
          - B10
          SC IfZAddCount

          ;Auto modificação
          LD AmEnd1
          +  dois
          MM AmEnd1

          LD AmEnd2
          +  dois
          MM AmEnd2

          JP inicio

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

IfZAddCount       $ /0001
               JZ contAddCount ;Se nao for igual a zero, vai pra fimAddCount
               JP fim
fimAddCount    RS IfZAddCount
contAddCount   LD count
               + um
               MM count
               JP fimAddCount

Verifica  $ /0001
          JZ A ;Se o acumulador é 0, vai verificar se o count tambem é zero. Se sim, vai para fim do programa

A         LD count
          JZ fim

# main 

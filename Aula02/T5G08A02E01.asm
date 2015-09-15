@ /0000             ;Inicio do programa
main  JP  inicio    ;Jump para o inicio do programa
entradaA  K  /00FA  ;Entrada A
entradaB  K  /00FF  ;Entrada B
saida     $  /0001  ;Endereço de saida
cem       K  /0100  ;100 constante
inicio    LD entradaA ;Carrega no acc <- entradaA
          SC PACK   ;chama surotina pack(a,b)
          MM saida  ;guarda o resultado da subrotina
fim       HM fim
PACK      $ /0001
          *  cem    ; multiplca por cem
          +  entradaB
          RS PACK
# main 

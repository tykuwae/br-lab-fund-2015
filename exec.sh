java -cp MLR.jar montador.MvnAsm $1
java -cp MLR.jar linker.MvnLinker T5G08A03E02_main.mvn T5G08A03E02_rotinas.mvn T5G08A03E02_const.mvn -s T5G08A03E02_saida.mvn
java -cp MLR.jar relocator.MvnRelocator <arquivo-objeto> <arquivo-saida> <base-relocação> <endereço-inicio-execução>
java -Dfile.encoding=cp850 -jar mvn.jar
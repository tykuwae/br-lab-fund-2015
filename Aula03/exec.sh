java -cp MLR.jar montador.MvnAsm $1
java -cp MLR.jar linker.MvnLinker <arquivo-objeto1> <arquivo-objeto2> <arquivo-objetoN> -s <arquivo-saida>
java -cp MLR.jar relocator.MvnRelocator <arquivo-objeto> <arquivo-saida> <base-relocação> <endereço-inicio-execução>
java -Dfile.encoding=cp850 -jar mvn.jar
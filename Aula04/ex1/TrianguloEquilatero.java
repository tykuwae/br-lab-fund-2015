/**
 *
 * @author Diego
 */
public class TrianguloEquilatero extends TrianguloIsosceles {
    
    public TrianguloEquilatero(float lado){
        super(lado, lado);
    }

    @Override
	/**
	*	Executa a validação do triângulo equilátero. Indiretamente, é verificada a validade do polígono (através da verificação de validade do triângulo).
		Ao final, verifica-se a igualdade entre os lados.
	* @author Grupo
	*/
    public boolean validar() {
        // TODO: verificar se equilatero
		//Nao esquecer de chamar tambem a classe pai para fazer a validacao!
		float ladoA,ladoB,ladoC;
		if(super.validar()){
			ladoA = lados[0];
			ladoB = lados[1];
			ladoC = lados[2];
			return (ladoA==ladoB) && (ladoB==ladoC);
		}
		
		return false;
		
    }
    
}

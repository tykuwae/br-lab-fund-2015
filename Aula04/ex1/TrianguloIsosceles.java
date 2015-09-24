/**
 *
 * @author Diego
 */
public class TrianguloIsosceles extends Triangulo {
    
    public TrianguloIsosceles(float ladoA, float ladoB){
        super(ladoA, ladoA, ladoB);
    }

    @Override
	/**
	*	Executa a validação do triângulo. Como o próprio construtor já impõe que o triângulo seja isósceles, basta verificar se o triângulo em si é consistente.
	* @author Grupo
	*/
    public boolean validar() {
        // TODO: verificar se isosceles
      return super.validar();
		//Nao esquecer de chamar tambem a classe pai para fazer a validacao!
    }
    
}

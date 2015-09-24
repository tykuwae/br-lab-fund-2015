/**
 *
 * @author Diego
 */
public class Triangulo extends Poligono {
	
	 
    public Triangulo(float ladoA, float ladoB, float ladoC){
        super(new float[]{ladoA, ladoB, ladoC});
    }

	/**
	*	Executa a validação do triângulo. Primeiramente, verifica-se a validade do polígono, e posteriormente é aplicada a regra que consta no comentário da função.
	* @author Grupo
	*/
    @Override
    public boolean validar() {
        /* Um triangulo deve ter 3 lados e a soma
         * de dois lados deve ser MENOR que o
         * terceiro lado.
		 
		 
		 
         */
        if (super.validar() &&
            lados[0] + lados[1] > lados[2] && 
            lados[0] + lados[2] > lados[1] &&
            lados[2] + lados[1] > lados[0])
            return true;  
        else 
            return false; 
        
    }
    
    
}

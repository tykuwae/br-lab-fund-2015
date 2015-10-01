

public class Retangulo extends Quadrilatero {
	
	public Retangulo(float ladoA, float ladoB){		
		super(ladoA, ladoB, ladoA, ladoB);		
	}
	
	/**
	* Como o construtor impõe os dois lados para o construtor, basta validar como um polígono.
	* @author Grupo
	*/
	
	@Override
	public boolean validar(){
		
		return super.validar();
		
		
	} 
}


	


public class Quadrado extends Retangulo {
	
	public Quadrado(float ladoA){		
		super(ladoA,ladoA);		
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


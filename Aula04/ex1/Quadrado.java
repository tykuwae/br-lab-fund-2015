

public class Quadrado extends Retangulo {
	
	public Retangulo(float ladoA){		
		super(new float[]{ladoA,ladoA});		
	}
	
	/**
	* Como o construtor impõe os dois lados para o construtor, basta validar como um polígono.
	* @author Grupo
	*/
	
	@Override
	public Quadrado validar(){
		
		return super.validar();		
		
	} 
}




public class Retangulo extends Poligono {
	
	public Retangulo(float ladoA, float ladoB){		
		super(new float[]{ladoA, ladoB, ladoA, ladoB});		
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


	
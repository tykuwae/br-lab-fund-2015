public class Quadrilatero extends Poligono {
  
  public Quadrilatero(float ladoA, float ladoB, float ladoC, float ladoD){    
    super(new float[]{ladoA, ladoB, ladoC, ladoD});    
  }
  
  /**
  * Como o construtor impõe os quatro lados para o construtor, basta validar como um polígono.
  * @author Grupo
  */
  
  @Override
  public boolean validar(){
    return super.validar();   
    
  } 
}


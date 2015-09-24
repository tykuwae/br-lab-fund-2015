/**
 *
 * @author Diego
 */
public class TrianguloEquilatero extends TrianguloIsosceles {
    
    public TrianguloEquilatero(float lado){
        super(lado, lado);
    }

    @Override
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

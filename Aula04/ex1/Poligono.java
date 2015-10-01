/**
 *
 * @author Diego
 */
public class Poligono {
    float[] lados;
    
    public Poligono(float[] lados){
        this.lados = lados;
    }
    
    /**
	*	Valida o polígono. Para que o array descreva um polígono consistente, basta que ele tenha mais de três entradas.
	* @author Grupo
	*/
    public boolean validar(){
        /* Não sei que forma é, então o melhor
         * que eu posso fazer é verificar se possui
         * pelo menos 3 lados.
         */
        // System.out.println("validou poligono");
        boolean ok;
        // System.out.println(lados.length);
        if (lados.length < 3){
            // System.out.println("entrou no if do poligono");
            ok = false;
        }
        else{
           // System.out.println("entrou no else do poligono");
	       ok = true;
        }
       return ok;
        // TODO: verificar se forma tem 3 lados
    }
    
    public float perimetro(){
        float soma = 0;
        for ( float i : lados ){
            soma += i;
        }
        return soma;
    }
    
    public void imprime(){
        System.out.println(getClass().getName());
        
        System.out.print("Lados: ");
        
        StringBuilder txt = new StringBuilder();
        String sep = "";
        for ( float i : lados ){
            txt.append(sep).append(i);
            sep = ", ";
        }
        System.out.println(txt);
        
        System.out.print("Perimetro: ");
        System.out.println(perimetro());
        
        if (validar()){
            System.out.println("Forma valida!");
        } else {
            System.out.println("Forma invalida!");
        }
        System.out.println();
    }
    
}

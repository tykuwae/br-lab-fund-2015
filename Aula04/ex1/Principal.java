/**
 *
 * @author Diego
 */
public class Principal {

    public static void main(String[] args) {
        
        Poligono p = new Poligono(new float[]{10, 20, 30, 40, 50});
        p.imprime();
        
        p = new Triangulo(3, 4, 5);
        p.imprime();
		
		Triangulo t = new TrianguloEquilatero(2);
		t.imprime();
		
        TrianguloIsosceles i = new TrianguloIsosceles(2, 4);
        i.imprime();

        TrianguloEscaleno e = new TrianguloEscaleno(2,3,4);
        e.imprime();

    }
}

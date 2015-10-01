/**
 *
 * @author Diego
 */
public class Principal {

    public static void main(String[] args) {
        
        Poligono p = new Poligono(new float[]{10, 20, 30, 40, 50});
        p.imprime();
        
        Quadrilatero quadrilatero = new Quadrilatero(10, 20, 30, 40);
        quadrilatero.imprime();

        Retangulo retangulo = new Retangulo(10, 20);
        retangulo.imprime();

        Quadrado quadrado = new Quadrado(10);
        quadrado.imprime();

        Triangulo triangulo = new Triangulo(3, 4, 5);
        triangulo.imprime();
		
		TrianguloEquilatero t = new TrianguloEquilatero(2);
		t.imprime();
		
        TrianguloIsosceles i = new TrianguloIsosceles(2, 1);
        i.imprime();

        TrianguloEscaleno e = new TrianguloEscaleno(2,3,4);
        e.imprime();

    }
}

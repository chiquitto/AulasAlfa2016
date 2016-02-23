package aulajava;

/**
 *
 * @author faculdadealfa
 */
public class MatematicaTest {
    public static void main(String[] args) {
        Matematica.numero = 10;
        
        Matematica m1 = new Matematica();
        Matematica m2 = new Matematica();
        
        System.out.println(m1.numero);
        System.out.println(m2.numero);
        
        //System.out.println(Matematica.somar(1, 4));
    }
}

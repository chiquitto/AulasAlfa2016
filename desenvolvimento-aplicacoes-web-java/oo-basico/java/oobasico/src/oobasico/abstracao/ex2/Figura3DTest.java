package oobasico.abstracao.ex2;

/**
 *
 * @author chiquitto
 */
public class Figura3DTest {
  public static void main(String[] args) {
    Figura3D cil = new Cilindro(3, 4);
    Figura3D cub = new Cubo(3);
    Figura3D pir = new Piramide(1, 2, 3);
    
    System.out.println("Cilindro:" + cil.volume());
    System.out.println("Cubo:" + cub.volume());
    System.out.println("Piramide:" + pir.volume());
  }
}

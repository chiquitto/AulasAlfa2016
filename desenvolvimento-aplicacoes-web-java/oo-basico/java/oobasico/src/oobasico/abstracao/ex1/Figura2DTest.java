package oobasico.abstracao.ex1;

/**
 *
 * @author chiquitto
 */
public class Figura2DTest {
  public static void main(String[] args) {
    Figura2D q = new Quadrado(3);
    Figura2D c = new Circulo(3);
    Figura2D t = new TrianguloRet(3,4);
    
    System.out.println("Areas");
    System.out.println("Quadrado:" + q.area());
    System.out.println("Circulo:" + c.area());
    System.out.println("Triangulo:" + t.area());
    
    System.out.println("Perimetros");
    System.out.println("Quadrado:" + q.perimetro());
    System.out.println("Circulo:" + c.perimetro());
    System.out.println("Triangulo:" + t.perimetro());
  }
}

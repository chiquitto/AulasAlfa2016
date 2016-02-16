package oobasico.abstracao.ex1;

/**
 *
 * @author chiquitto
 */
public class Circulo extends Figura2D {
  private double raio;

  public Circulo(double raio) {
    this.raio = raio;
  }
  
  @Override
  public double area() {
    return Math.PI * raio * raio;
  }
  
  @Override
  public double perimetro() {
    return 2 * Math.PI * raio;
  }
}

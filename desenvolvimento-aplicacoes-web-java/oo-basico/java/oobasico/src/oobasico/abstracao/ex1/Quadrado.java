package oobasico.abstracao.ex1;

/**
 *
 * @author chiquitto
 */
public class Quadrado extends Figura2D {
  private double base;
  
  public Quadrado(double base) {
    this.base = base;
  }

  @Override
  public double area() {
    return base * base;
  }

  @Override
  public double perimetro() {
    return base * 4;
  }
}

package oobasico.abstracao.ex2;

/**
 *
 * @author chiquitto
 */
public class Cubo extends Figura3D {
  private double base;
  public Cubo(double base) {
    this.base = base;
  }
  
  @Override
  public double volume() {
    return Math.pow(base, 3);
  }
}

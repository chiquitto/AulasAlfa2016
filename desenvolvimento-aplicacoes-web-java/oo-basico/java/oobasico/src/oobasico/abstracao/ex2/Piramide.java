package oobasico.abstracao.ex2;

/**
 *
 * @author chiquitto
 */
public class Piramide extends Figura3D {
  private double altura;
  private double base1;
  private double base2;

  public Piramide(double a, double b1, double b2) {
    this.altura = a;
    this.base1 = b1;
    this.base2 = b2;
  }

  @Override
  public double volume() {
    double area = base1 * base2 / 2;
    return area * altura / 3;
  }
}

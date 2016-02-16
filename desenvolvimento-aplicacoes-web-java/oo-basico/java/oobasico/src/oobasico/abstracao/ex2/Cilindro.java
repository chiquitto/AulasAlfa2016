package oobasico.abstracao.ex2;

/**
 *
 * @author chiquitto
 */
public class Cilindro extends Figura3D {
  private double altura;
  private double raio;
  public Cilindro(double altura, double raio) {
    this.altura = altura;
    this.raio = raio;
  }

  @Override
  public double volume() {
    double area = Math.PI * raio * raio;
    return area * altura;
  }
}

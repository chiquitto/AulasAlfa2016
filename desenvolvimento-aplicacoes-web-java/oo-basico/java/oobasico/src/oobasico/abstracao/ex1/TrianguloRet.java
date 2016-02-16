package oobasico.abstracao.ex1;

/**
 *
 * @author chiquitto
 */
public class TrianguloRet extends Figura2D {
  private double altura;
  private double base;

  public TrianguloRet(double altura, double base) {
    this.altura = altura;
    this.base = base;
  }
  
  public double hipotenusa() {
    return Math.sqrt((altura + altura) + (base * base));
  }
  
  @Override
  public double area() {
    return base * altura / 2;
  }
  
  @Override
  public double perimetro() {
    return base + altura + hipotenusa();
  }
}

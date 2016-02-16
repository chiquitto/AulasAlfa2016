package oobasico.secao1.ex6;

/**
 *
 * @author chiquitto
 */
class Funcionario {
  public double salario;

  public void aumentaSalario() {
    aumentaSalario(0.1);
  }

  public void aumentaSalario(double taxa) {
    salario += salario * taxa;
  }
}

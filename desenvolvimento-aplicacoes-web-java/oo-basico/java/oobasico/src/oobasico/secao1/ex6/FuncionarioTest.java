package oobasico.secao1.ex6;

/**
 *
 * @author chiquitto
 */
public class FuncionarioTest {
  public static void main(String[] args) {
    Funcionario f = new Funcionario();
    f.salario = 1000;
    f.aumentaSalario();
    System.out.println(f.salario);
    f.salario = 1000;
    f.aumentaSalario(0.2);
    System.out.println(f.salario);
  }
}

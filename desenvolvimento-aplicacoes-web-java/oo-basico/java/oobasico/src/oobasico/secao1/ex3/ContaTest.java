package oobasico.secao1.ex3;

/**
 *
 * @author chiquitto
 */
public class ContaTest {
  public static void main(String[] args) {
    Conta c = new Conta();
    c.deposito(1000);
    c.saque(250);
    
    System.out.println(c.saldo);
  }
}

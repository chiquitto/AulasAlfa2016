package oobasico.secao1.ex4;

/**
 *
 * @author chiquitto
 */
public class ContaTest {
  public static void main(String[] args) {
    Conta c1 = new Conta();
    Conta c2 = new Conta();
    c1.deposito(1000);
    c1.transferir(300, c2);
    System.out.println(c1.saldo);
    System.out.println(c2.saldo);
  }
}

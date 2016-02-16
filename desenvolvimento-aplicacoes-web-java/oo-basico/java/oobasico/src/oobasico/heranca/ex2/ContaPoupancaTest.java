package oobasico.heranca.ex2;

/**
 *
 * @author chiquitto
 */
public class ContaPoupancaTest {
  public static void main(String[] args) {
    ContaPoupanca cc = new ContaPoupanca();
    cc.deposita(1000);
    System.out.println(cc.saldo());
    cc.atualiza(0.2);
    System.out.println(cc.saldo());
    cc.saque(100);
    System.out.println(cc.saldo());
  }
}

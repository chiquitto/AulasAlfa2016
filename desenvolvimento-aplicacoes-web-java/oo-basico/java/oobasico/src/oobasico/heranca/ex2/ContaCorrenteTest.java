package oobasico.heranca.ex2;

/**
 *
 * @author chiquitto
 */
public class ContaCorrenteTest {
  public static void main(String[] args) {
    ContaCorrente cc = new ContaCorrente();
    cc.deposita(1000.1);
    System.out.println(cc.saldo());
    cc.atualiza(0.2);
    System.out.println(cc.saldo());
    cc.saque(100);
    System.out.println(cc.saldo());
  }
}

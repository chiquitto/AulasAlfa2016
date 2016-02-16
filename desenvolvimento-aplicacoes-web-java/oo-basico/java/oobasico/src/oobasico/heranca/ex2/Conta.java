package oobasico.heranca.ex2;

/**
 *
 * @author chiquitto
 */
public class Conta {
  protected double saldo;
  public void atualiza(double taxa) {
    saldo += saldo * taxa;
  }
  public void deposita(double valor) {
    saldo += valor;
  }
  public double saldo() {
    return saldo;
  }
  public void saque(double valor) {
    saldo -= valor;
  }
}

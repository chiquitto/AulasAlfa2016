package oobasico.heranca.ex2;

/**
 *
 * @author chiquitto
 */
public class ContaCorrente extends Conta {
  @Override
  public void atualiza(double taxa) {
    saldo += saldo * taxa * 2;
  }
  @Override
  public void deposita(double valor) {
    saldo += valor - 0.1;
  }
}

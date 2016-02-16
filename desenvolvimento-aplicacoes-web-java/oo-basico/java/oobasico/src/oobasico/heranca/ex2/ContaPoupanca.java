package oobasico.heranca.ex2;

/**
 *
 * @author chiquitto
 */
public class ContaPoupanca extends Conta {
  @Override
  public void atualiza(double taxa) {
    saldo += saldo * taxa * 3;
  }
}

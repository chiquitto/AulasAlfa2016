package oobasico.secao1.ex3;

/**
 *
 * @author chiquitto
 */
public class Conta {
  public double saldo = 0;
  public void deposito(double valor) {
    saldo += valor;
  }
  public void saque(double valor) {
    saldo -= valor;
  }
}

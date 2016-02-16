package oobasico.secao1.ex4;

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
  public void transferir(double valor, Conta conta) {
    saque(valor);
    conta.deposito(valor);
  }
}

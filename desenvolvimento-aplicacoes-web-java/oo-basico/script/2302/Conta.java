

package alfa;


public class Conta {
  public double saldo;

  public Conta() {
    this.saldo = 0;
  }
  
  public Conta(double saldo) {
    this.saldo = saldo;
  }
  
  public void deposito(double valor){
    saldo += valor;
  }
  
  public void saque (double valor){
    if (valor <= saldo) {
      saldo -= valor;
    }
  }
  
  public void transferir(double valor, Conta conta) {
    this.saque(valor);
    conta.deposito(valor);
  }
  
}

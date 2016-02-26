package alfa;

public class ContaCorrente extends Conta {
  private double limite = 100;
  
  @Override
  public void saque(double valor) {
    double podeSacar = limite + saldo;
    if (podeSacar >= valor) {
      saldo -= valor;
    }
  }
}

package alfa;

public class ContaCorrenteTest {
  public static void main(String[] args) {
    ContaCorrente c = new ContaCorrente();
    System.out.println(c.saldo);
    
    c.deposito(50);
    System.out.println(c.saldo);
    
    c.saque(75);
    System.out.println(c.saldo);
    
    c.saque(75);
    System.out.println(c.saldo);
    
    c.saque(1);
    System.out.println(c.saldo);
    
    c.deposito(200);
    System.out.println(c.saldo);
  }
}

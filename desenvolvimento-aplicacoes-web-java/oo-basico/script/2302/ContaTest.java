
package alfa;


public class ContaTest {
  public static void main(String[] args){
    Conta c = new Conta();
    System.out.println(c.saldo);
    
    c.deposito(100.00);
    c.saque(50.00);
    System.out.println(c.saldo);
    
    Conta c1 = new Conta(100.0);
    System.out.println(c1.saldo);
    
    c.transferir(40, c1);
    System.out.println(c.saldo);
    System.out.println(c1.saldo);
  }
  
}

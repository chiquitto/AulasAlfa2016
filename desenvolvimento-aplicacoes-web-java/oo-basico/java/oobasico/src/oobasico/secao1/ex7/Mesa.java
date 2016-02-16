package oobasico.secao1.ex7;

/**
 *
 * @author chiquitto
 */
public class Mesa {
  public double conta;
  
  public void pagar() {
    pagar(conta);
  }
  public void pagar(double valor) {
    conta -= valor;
  }
}

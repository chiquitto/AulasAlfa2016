package oobasico.secao1.ex7;

/**
 *
 * @author chiquitto
 */
public class MesaTest {
  public static void main(String[] args) {
    Mesa m = new Mesa();
    m.conta = 100;
    m.pagar(60);
    System.out.println(m.conta);
    m.pagar();
    System.out.println(m.conta);
  }
}

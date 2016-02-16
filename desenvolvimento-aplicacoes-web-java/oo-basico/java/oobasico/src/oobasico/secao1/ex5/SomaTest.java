package oobasico.secao1.ex5;

/**
 *
 * @author chiquitto
 */
public class SomaTest {
  public static void main(String[] args) {
    Soma s = new Soma();
    System.out.println(s.somar("A", "B"));
    System.out.println(s.somar(1, 2));
    System.out.println(s.somar(1.5, 2.5));
  }
}

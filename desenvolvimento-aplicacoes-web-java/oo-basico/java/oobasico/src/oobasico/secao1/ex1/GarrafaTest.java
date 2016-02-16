package oobasico.secao1.ex1;

/**
 *
 * @author chiquitto
 */
public class GarrafaTest {
  public static void main(String[] args) {
    Garrafa g = new Garrafa();
    g.cor = "Vermelho";
    g.volumeAtual = 250;
    g.volumeTotal = 500;
    g.abrir();
    System.out.println(g.cor);
    System.out.println(g.volumeAtual);
    System.out.println(g.volumeTotal);
    System.out.println(g.aberta);
  }
}

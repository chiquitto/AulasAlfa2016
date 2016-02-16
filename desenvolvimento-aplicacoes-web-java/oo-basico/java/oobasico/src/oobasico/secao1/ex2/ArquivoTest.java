package oobasico.secao1.ex2;

/**
 *
 * @author chiquitto
 */
public class ArquivoTest {
  public static void main(String[] args) {
    Arquivo o = new Arquivo();
    o.abrir();
    o.salvar("Lorem Ipsum");
    System.out.println(o.aberto);
    System.out.println(o.conteudo);
  }
}

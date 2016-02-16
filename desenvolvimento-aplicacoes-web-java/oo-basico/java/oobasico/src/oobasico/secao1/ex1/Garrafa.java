package oobasico.secao1.ex1;

/**
 *
 * @author chiquitto
 */
public class Garrafa {

  public int volumeTotal;
  public int volumeAtual;
  public String cor;
  public boolean aberta;

  public void abrir() {
    aberta = true;
  }

  public void fechar() {
    aberta = false;
  }
}

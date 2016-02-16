package oobasico.secao1.ex2;

/**
 *
 * @author chiquitto
 */
public class Arquivo {
  public String conteudo;
  public boolean aberto;
  
  public void abrir() {
    aberto = true;
  }
  public void fechar() {
    aberto = false;
  }
  public boolean salvar(String conteudo1) {
    if (!aberto) {
      return false;
    }
    conteudo = conteudo1;
    fechar();
    return true;
  }
}

package alfa;

public class Telefone {
  private String numero = "";
  private boolean ocupado = false;
  
  public void fazerLigacao() {
    ocupado = true;
    numero = "";
  }
  
  public void discarNumero(String n) {
    numero += n;
  }
  
  public void encerrarLigacao() {
    ocupado = false;
  }
  
  public String getNumero() {
    return numero;
  }
}

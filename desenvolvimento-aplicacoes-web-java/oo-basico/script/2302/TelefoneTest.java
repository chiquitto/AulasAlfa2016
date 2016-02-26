package alfa;

public class TelefoneTest {
  public static void main(String[] args) {
    Telefone t = new Telefone();
    t.discarNumero("4");
    t.discarNumero("4");
    t.discarNumero("9");
    t.discarNumero("9");
    t.discarNumero("1");
    t.discarNumero("2");
    t.discarNumero("3");
    t.discarNumero("4");
    t.discarNumero("5");
    t.discarNumero("6");

    t.fazerLigacao();
    t.encerrarLigacao();
  }
}

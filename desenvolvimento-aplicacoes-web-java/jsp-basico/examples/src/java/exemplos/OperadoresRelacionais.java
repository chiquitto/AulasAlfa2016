package exemplos;

/**
 *
 * @author chiquitto
 */
public class OperadoresRelacionais {
  public static void main(String[] args) {
    int a = 4;
    int b = 2;
    
    boolean igualdade = (a == b); // false
    boolean desigualdade = (a != b); // true
    boolean maior = (a > b); // true
    boolean menor = (a < b); // false
    boolean maiorIgual = (a >= b); // true
    boolean menorIgual = (a <= b); // false
    
    System.out.println(igualdade);
    System.out.println(desigualdade);
    System.out.println(maior);
    System.out.println(menor);
    System.out.println(maiorIgual);
    System.out.println(menorIgual);
  }
}

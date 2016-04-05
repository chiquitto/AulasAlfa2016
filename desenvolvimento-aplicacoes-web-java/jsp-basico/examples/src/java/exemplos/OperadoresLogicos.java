package exemplos;

/**
 *
 * @author chiquitto
 */
public class OperadoresLogicos {
  public static void main(String[] args) {
    boolean a = true;
    boolean b = false;
    
    boolean and = (a && b); // false
    boolean or = (a || b); // true
    boolean notA = !a; // false
    boolean notB = !b; // true
    
    System.out.println(and);
    System.out.println(or);
    System.out.println(notA);
    System.out.println(notB);
  }
}

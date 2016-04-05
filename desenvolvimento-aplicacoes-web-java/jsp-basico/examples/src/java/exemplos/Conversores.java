package exemplos;

/**
 *
 * @author chiquitto
 */
public class Conversores {

  public static void main(String[] args) {
    String string = "65";
    
    byte b1 = Byte.parseByte(string);
    System.out.println(b1);
    
    int i1 = Integer.parseInt(string);
    System.out.println(i1);
    
    float f1 = Float.parseFloat(string);
    System.out.println(f1);
    
    String string2 = String.valueOf(i1);
    System.out.println(string2);
  }
}

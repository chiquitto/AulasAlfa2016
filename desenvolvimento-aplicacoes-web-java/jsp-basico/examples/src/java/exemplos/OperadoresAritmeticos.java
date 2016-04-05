package exemplos;

/**
 *
 * @author chiquitto
 */
public class OperadoresAritmeticos {

  public static void main(String[] args) {
    int a = 4;
    int b = 2;

    int soma = a + b; // 6
    int subtracao = a - b; // 2
    int multiplicacao = a * b; // 8
    double multiplicacao2 = a * 2.0; // 8.0
    int divisao = a / b; // 2
    double divisao2 = a / 2.0; // 2.0
    int modulo = a % b; // 0

    System.out.println(soma);
    System.out.println(subtracao);
    System.out.println(multiplicacao);
    System.out.println(multiplicacao2);
    System.out.println(divisao);
    System.out.println(divisao2);
    System.out.println(modulo);
  }
}

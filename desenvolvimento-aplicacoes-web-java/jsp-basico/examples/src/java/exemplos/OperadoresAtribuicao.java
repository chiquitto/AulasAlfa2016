package exemplos;

/**
 *
 * @author chiquitto
 */
public class OperadoresAtribuicao {

  public static void main(String[] args) {
    int n = 4;

    int soma = 10;
    soma += n; // 14
    
    int subtracao = 10;
    subtracao -= n; // 6
    
    int multiplicacao = 10;
    multiplicacao *= n; // 40
    
    double divisao = 10;
    divisao /= 4; // 2.5
    
    int modulo = 10;
    modulo %= n; // 2

    System.out.println(soma);
    System.out.println(subtracao);
    System.out.println(multiplicacao);
    System.out.println(divisao);
    System.out.println(modulo);
  }
}

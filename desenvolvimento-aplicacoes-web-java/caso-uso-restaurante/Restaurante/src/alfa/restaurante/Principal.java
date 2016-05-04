package alfa.restaurante;

public class Principal {

    public static void main(String[] args) {
        Restaurante r = new Restaurante();
        
        Mesa mesa1 = r.abrirMesa();
        mesa1.addProduto(new Produto("Salada", 15));
        mesa1.addProduto(new Produto("Churrasco", 30));
        mesa1.addProduto(new Produto("Suco de Laranja", 10));
        mesa1.addProduto(new Produto("Sobremesa", 5));
        
        mesa1.pagar(10);
        mesa1.pagar(10);
        mesa1.pagar(100);
        
        System.out.println("valorpago:" + mesa1.calcValorPago());
        
        System.out.println("consumido:" + mesa1.calcConsumido());
        
        System.out.println("restante:" + mesa1.calcTotal());
        
        if (mesa1.podeFechar()){
            System.out.println("pode fechar");
        }
        
    }
    
}

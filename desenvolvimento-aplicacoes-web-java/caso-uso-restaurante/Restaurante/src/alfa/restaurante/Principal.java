package alfa.restaurante;

public class Principal {

    public static void main(String[] args) {
        Restaurante r = new Restaurante();
        
        int idMesa1 = r.abrirMesa();
        r.getMesa(idMesa1).addProduto(new Produto("Pizza", 30));
        r.getMesa(idMesa1).addProduto(new Produto("Vinho", 15));
        
        r.getMesa(idMesa1).pagar(15);
        
        
        float valorParte = r.getMesa(idMesa1).calcParte(3);
              
        //r.getMesa(idMesa1).pagar(valorParte);
        r.getMesa(idMesa1).pagar(valorParte);
        r.getMesa(idMesa1).pagar(valorParte);
        
        float totalMesa1 = r.getMesa(idMesa1).calcTotal();        
        float pagoMesa1 = r.getMesa(idMesa1).getValorPago();
        float consuMesa1 = r.getMesa(idMesa1).calcConsumido();
        
       
        System.out.println("Valor consumido " +idMesa1+ " é " + consuMesa1);        
        System.out.println("Valor pago da mesa "+idMesa1+" é " + pagoMesa1);
        System.out.println("O restante da mesa "+idMesa1+" é "+totalMesa1);
        
        if (r.getMesa(idMesa1).podeFechar()){
            System.out.println("Pode fechar a mesa " +idMesa1);        
        }
    }
    
}

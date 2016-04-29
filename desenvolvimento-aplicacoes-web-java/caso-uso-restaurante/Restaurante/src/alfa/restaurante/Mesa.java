package alfa.restaurante;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Mesa {
    private List<Produto> produtos = new ArrayList<>();
    private float valorPago = 0;
    
    
    public Mesa() {
    }
    public int addProduto(Produto prod) {
        this.produtos.add(prod);
        return this.produtos.size() -1;
    }
    
    public float calcConsumido() {
        float total = 0;
        for (Produto prod: produtos){
            total = total + prod.getValorUnitario();
        }
        return total;
    }
    public float calcTotal() {
        return this.calcConsumido() - this.getValorPago();
    }
    
    
    public void pagar(float valor) {
        this.valorPago = this.valorPago + valor;
    }
    
    public float getValorPago(){    
        return  valorPago;
    }
    public float calcParte(int parcelas){
        return this.calcTotal() / parcelas ;    
    }
    public boolean podeFechar(){
        return (this.calcTotal() <= 0);
    }
    
}

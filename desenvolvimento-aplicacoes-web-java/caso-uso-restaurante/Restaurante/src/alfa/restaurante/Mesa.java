package alfa.restaurante;

public class Mesa {

    private int idMesa;

    public Mesa(int idMesa) {
        this.idMesa = idMesa;
    }
    
    public void addProduto(Produto prod) {
        
    }

    public float calcConsumido() {
        return 1;
    }

    public float calcParte(int parcelas) {
        return this.calcTotal() / parcelas;
    }

    public float calcTotal() {
        return this.calcConsumido() - this.calcValorPago();
    }

    public float calcValorPago() {
        return 1;
    }

    public int getIdMesa() {
        return idMesa;
    }
    
    public void pagar(float valor) {

    }

    public boolean podeFechar() {
        return (this.calcTotal() <= 0);
    }

}

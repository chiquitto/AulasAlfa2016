package alfa.restaurante;

/**
 *
 * @author chiquitto
 */
public class Produto {
    private String descricao;
    private float valorUnitario;

    public Produto(String descricao, float valorUnitario) {
        this.descricao = descricao;
        this.valorUnitario = valorUnitario;
    }

    public String getDescricao() {
        return descricao;
    }

    public float getValorUnitario() {
        return valorUnitario;
    }
    

    
    
}

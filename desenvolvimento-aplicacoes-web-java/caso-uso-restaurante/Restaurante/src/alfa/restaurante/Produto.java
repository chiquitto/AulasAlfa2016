package alfa.restaurante;

/**
 *
 * @author chiquitto
 */
public class Produto {

    private int idProduto;
    private String descricao;
    private float valorUnitario;

    public Produto(String descricao, float valorUnitario) {
        this.descricao = descricao;
        this.valorUnitario = valorUnitario;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getDescricao() {
        return descricao;
    }

    public float getValorUnitario() {
        return valorUnitario;
    }

}

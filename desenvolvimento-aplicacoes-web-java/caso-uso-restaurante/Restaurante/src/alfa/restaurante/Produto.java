package alfa.restaurante;

/**
 *
 * @author chiquitto
 */
public class Produto {
    private String descricao;
    private String valorUnitario;
    private String qtd;

    public Produto(String descricao, String valorUnitario, String qtd) {
        this.descricao = descricao;
        this.valorUnitario = valorUnitario;
        this.qtd = qtd;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(String valorUnitario) {
        this.valorUnitario = valorUnitario;
    }

    public String getQtd() {
        return qtd;
    }

    public void setQtd(String qtd) {
        this.qtd = qtd;
    }
    
}

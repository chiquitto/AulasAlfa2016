package alfa.model;

import java.math.BigDecimal;

/**
 *
 * @author chiquitto
 */
public class Professor extends Pessoa {

    private BigDecimal salario;

    public BigDecimal getSalario() {
        return salario;
    }

    public void setSalario(BigDecimal salario) {
        this.salario = salario;
    }

}

package alfa.dao;

import alfa.util.Conexao;
import java.sql.Connection;

/**
 *
 * @author chiquitto
 */
public class AbstractDao {

    protected Connection conexao;

    public AbstractDao() {
        conexao = Conexao.getConexao();
    }
}

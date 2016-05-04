package alfa.restaurante;

// import com.mysql.jdbc.Driver;
import org.sqlite.JDBC;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author chiquitto
 */
public class Conexao {

    private static Connection conexao;
    
    public static Connection getConexao() {
        if (conexao == null) {
            try {
                DriverManager.registerDriver(new JDBC());
                conexao = DriverManager.getConnection("jdbc:sqlite:/Users/faculdadealfa/chiquitto/caso-uso-restaurante/banco/restaurante.sqlite.db");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return conexao;
    }
}

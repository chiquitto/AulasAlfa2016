package alfa.util;

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

    //private static final String URL = "jdbc:mysql://localhost:3306/jsp";
    //private static final String USUARIO = "root";
    //private static final String SENHA = "123456";
    
    public static Connection getConexao() {
        if (conexao == null) {
            try {
                // Mysql
                // DriverManager.registerDriver(new Driver());
                // return DriverManager.getConnection(URL, USUARIO, SENHA);

                // Sqlite
                DriverManager.registerDriver(new JDBC());
                conexao = DriverManager.getConnection("jdbc:sqlite:DIRETORIO_BD/escola.sqlite.db");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return conexao;
    }
}

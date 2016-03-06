
import alfa.util.Conexao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Test {

    public static void main(String[] args) {
        consulta();
    }
    
    public static void consulta() {
        try {
            Connection con = Conexao.getConexao();
            
            String sql = "Select * From pessoa";
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
                System.out.println(rs.getInt("idpessoa"));
                System.out.println(rs.getString("nome"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}

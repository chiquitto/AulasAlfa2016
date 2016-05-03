package alfa.restaurante;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Restaurante {
    
    /**
     * Abrir uma mesa e retornar a Mesa
     * @return 
     */
    public Mesa abrirMesa() {
        Connection con = Conexao.getConexao();
        
        String sql = "Insert Into mesa (valorpago) Values (0)";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.executeUpdate();
            
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            
            return new Mesa(rs.getInt(1));
        } catch (SQLException ex) {
            return null;
        }
    }
    
    /**
     * Pesquisa uma mesa e retorna a Mesa
     * 
     * @param id
     * @return 
     */
    public Mesa getMesa(int id) {
        return null;
    }
    
}

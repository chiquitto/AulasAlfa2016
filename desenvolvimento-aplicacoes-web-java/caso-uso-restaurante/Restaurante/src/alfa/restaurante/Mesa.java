package alfa.restaurante;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Mesa {

    private int idMesa;

    public Mesa(int idMesa) {
        this.idMesa = idMesa;
    }
    
    public void addProduto(Produto prod) {
        String sql = "insert into produto (idmesa, descricao, valor) values (?,?,?)";
        Connection con = Conexao.getConexao();
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, this.getIdMesa());
            stmt.setString(2, prod.getDescricao());
            stmt.setFloat(3, prod.getValorUnitario());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public float calcConsumido() {
        String sql = "select sum(valor) valor from produto where idmesa = ? group by idmesa";
        
        Connection con = Conexao.getConexao(); 
        try {
            PreparedStatement stmt = con.prepareStatement(sql);            
            stmt.setInt(1, this.getIdMesa());
            ResultSet rs = stmt.executeQuery();
            return rs.getFloat("valor");           
        } catch (SQLException ex) {
            ex.printStackTrace();    
        }
        return 0;     
    }

    public float calcParte(int parcelas) {
        return this.calcTotal() / parcelas;
    }

    public float calcTotal() {       
        float total = this.calcConsumido() - this.calcValorPago();
        if (total < 0){
            return 0;
        } else {
            return total;
        } 
    }

    public float calcValorPago() {
       String sql ="Select valorpago from mesa where idmesa = ?";
       
       Connection con = Conexao.getConexao();
       
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, this.getIdMesa());
            ResultSet rs = stmt.executeQuery();
            return rs.getFloat("valorpago");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public int getIdMesa() {
        return idMesa;
    }
    
    public void pagar(float valor) {
        String sql = "UPDATE mesa SET valorpago = valorpago + ? WHERE idmesa = ?";
        
        Connection con = Conexao.getConexao();
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setFloat(1, valor);
            stmt.setInt(2, this.getIdMesa());
            
            stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public boolean podeFechar() {
        return (this.calcTotal() <= 0);
    }

}

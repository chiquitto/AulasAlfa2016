package blog.model;

import blog.model.vo.Categoria;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CategoriaDao {

    public void insert(Categoria categoria) {
        String sql = "Insert into categoria (categoria) values(?)";
        try {
            PreparedStatement st = Conexao.getConexao().prepareStatement(sql);
            st.setString(1, categoria.getCategoria());
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void atualizar(Categoria categoria){
        String sql = "Update categoria set categoria = ? where idcategoria = ?";
        try {
            PreparedStatement st = Conexao.getConexao().prepareStatement(sql);
            st.setString(1, categoria.getCategoria());
            st.setInt(2, categoria.getIdcategoria());
            st.executeUpdate(); 
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void deletar(Categoria categoria){
        String sql = "Delete from categoria where idcategoria = ?";
        
        try {
            PreparedStatement st = Conexao.getConexao().prepareStatement(sql);
            st.setInt(1, categoria.getIdcategoria());
            st.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void deletar (int idcategoria) {
        Categoria categoria = new Categoria();
        categoria.setIdcategoria(idcategoria);
        
        deletar(categoria);
    }
}

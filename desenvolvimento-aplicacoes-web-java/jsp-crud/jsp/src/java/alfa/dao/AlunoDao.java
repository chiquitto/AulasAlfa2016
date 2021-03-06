package alfa.dao;

import alfa.model.Aluno;
import alfa.model.Endereco;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chiquitto
 */
public class AlunoDao extends PessoaDao {
    
    public void apagar(Aluno aluno) {
        try {
            Endereco endereco = new Endereco();
            endereco.setIdpessoa(aluno.getIdpessoa());
            new EnderecoDao().apagar(endereco);
            
            String sqlDelete = "Delete From pessoa Where (idpessoa = ?) And (tipo = 1)";
            PreparedStatement stmtDelete = conexao.prepareStatement(sqlDelete);
            stmtDelete.setInt(1, aluno.getIdpessoa());
            stmtDelete.executeUpdate();
            stmtDelete.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void cadastrar(Aluno aluno) {
        String sql = "Insert Into pessoa"
                + " (tipo, nome, fone, email, numero, nascimento)"
                + " Values"
                + " (1, ?, ?, ?, ?, ?)";

        try {

            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getFone());
            stmt.setString(3, aluno.getEmail());
            stmt.setInt(4, aluno.getNumero());
            stmt.setString(5, aluno.getNascimento().toString());
            stmt.executeUpdate();
            stmt.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void editar(Aluno aluno) {
        String sql = "Update pessoa"
                + " Set "
                + " nome = ?,"
                + " fone = ?,"
                + " email = ?,"
                + " numero = ?,"
                + " nascimento = ?"
                + " Where (idpessoa = ?)"
                + "     And (tipo = 1)";

        try {

            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getFone());
            stmt.setString(3, aluno.getEmail());
            stmt.setInt(4, aluno.getNumero());
            stmt.setString(5, aluno.getNascimento().toString());
            stmt.setInt(6, aluno.getIdpessoa());
            stmt.executeUpdate();
            stmt.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public List<Aluno> getAll() {
        List<Aluno> alunos = new ArrayList<>();

        try {
            Statement st = conexao.createStatement();
            ResultSet rs = st.executeQuery("Select idpessoa, numero, nome, fone, email, nascimento From pessoa Where tipo=1");
            
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setIdpessoa(rs.getInt("idpessoa"));
                aluno.setNumero(rs.getInt("numero"));
                aluno.setNome(rs.getString("nome"));
                aluno.setFone(rs.getString("fone"));
                aluno.setEmail(rs.getString("email"));
                aluno.setNascimento(LocalDate.parse(rs.getString("nascimento"), dateTimeFormatter));

                alunos.add(aluno);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return alunos;
    }
}

package mb;

import br.com.chiquitto.aula.jdbcescola.vo.Aluno;
import javax.faces.bean.ManagedBean;

@ManagedBean
public class AlunoCreateMb {
    private Aluno aluno = new Aluno();

    public Aluno getAluno() {
        return aluno;
    }
    
    public void salvar(){
        System.out.println(aluno.getNumero());
        System.out.println(aluno.getNome());
    }
}

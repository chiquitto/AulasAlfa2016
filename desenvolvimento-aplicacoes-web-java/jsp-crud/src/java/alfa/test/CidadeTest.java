package alfa.test;

import alfa.dao.CidadeDao;
import alfa.model.Cidade;
import java.util.List;

public class CidadeTest {
    public static void main(String[] args) {
        listar();
    }

    private static void listar() {
        CidadeDao cid = new CidadeDao();
        
        List<Cidade> cidades = cid.getAll();
        
        for (Cidade cidade : cidades) {
            System.out.println(cidade.getIdcidade());
            System.out.println(cidade.getCidade());
        }
    }
}

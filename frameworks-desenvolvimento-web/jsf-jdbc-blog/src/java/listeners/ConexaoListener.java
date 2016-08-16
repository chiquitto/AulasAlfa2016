package listeners;

import br.com.chiquitto.aula.jdbcblog.Conexao;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ConexaoListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Conexao.setUrl("jdbc:sqlite:__DIRETORIO__/data/blog.sqlite.db");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
    
}

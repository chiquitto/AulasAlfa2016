package aulajava;

/**
 *
 * @author faculdadealfa
 */
public class EntrevistaTest {
    public static void main(String[] args) {
        Entrevista e = new Entrevista();
        e.definirCandidato("Giovane Lol");
        e.definirEntrevistador("Moacir");
        
        e.obterInformacoes("experiencia", "10");
        
        System.out.println(e.resultado());
    }
}

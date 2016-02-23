package aulajava;

/**
 *
 * @author faculdadealfa
 */
public class Entrevista {
    
    private String candidato;
    private String entrevistador;
    private String nascimento;
    private String experiencia;
    
    public void definirCandidato(String candidato) {
        this.candidato = candidato;
    }
    
    public void definirEntrevistador(String entrevistador) {
        this.entrevistador = entrevistador;
    }
    
    public void obterInformacoes(String info, String valor) {
        switch(info) {
            case "nascimento":
                this.nascimento = valor;
                break;
            case "experiencia":
                this.experiencia = valor;
        }
    }
    
    public boolean resultado() {
        int exp = Integer.parseInt(this.experiencia);
        
        if (exp >= 8) {
            return true;
        }
        return false;
    }
    
    
}

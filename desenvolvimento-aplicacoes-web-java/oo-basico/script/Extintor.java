package aulajava;

import java.util.Date;

/**
 *
 * @author faculdadealfa
 */
public class Extintor {
    public double tamanho;
    public double carga;
    public Date validade;
    public String classificacao;
    public String fabricante;
    public String empresa;
    
    public double pegarCarga() {
        return this.carga;
    }
    
    public boolean apagarIncendio() {
        while (this.carga > 0) {
            // liberar uma porcao da carga
            this.carga--;
        }
        return true;
    }
}

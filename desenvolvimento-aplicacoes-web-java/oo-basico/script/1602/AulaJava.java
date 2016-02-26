package aulajava;

import java.util.Date;

/**
 *
 * @author faculdadealfa
 */
public class AulaJava {

    public static void main(String[] args) {
        Extintor e = new Extintor();
        e.carga = 50;
        e.tamanho = 70;
        e.validade = new Date();
        
        System.out.println(e.pegarCarga());
        
        e.apagarIncendio();
        System.out.println(e.pegarCarga());
    }
    
}

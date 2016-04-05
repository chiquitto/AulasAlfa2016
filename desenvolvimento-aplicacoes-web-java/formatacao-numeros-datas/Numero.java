package javaapplication3;

import java.text.NumberFormat;
import java.util.Locale;

public class Numero {

    public static void main(String[] args) {
        float n = 12345.67f;
        
        System.out.println("Numero sem formatacao:" + n);
        
        NumberFormat format = NumberFormat.getInstance();
        String v1 = format.format(n);
        System.out.println("Numero formatado:" + v1);
        
        NumberFormat f1 = NumberFormat.getInstance(Locale.US);
        String v2 = f1.format(n);
        System.out.println("Numero formato US:" + v2);
        
        NumberFormat f2 = NumberFormat.getInstance(Locale.KOREA);
        String v3 = f2.format(n);
        System.out.println("Numero formatado Coreia:" + v3);
        
        Locale l1 = new Locale("pt", "br");
        NumberFormat f3 = NumberFormat.getInstance(l1);
        String v4 = f3.format(n);
        System.out.println("Numero formatado hueBR:" + v4);
        
        NumberFormat f4 = NumberFormat.getCurrencyInstance(l1);
        String v5 = f4.format(n);
        System.out.println("Dinheiro BR:" + v5);
        
        Locale l2 = new Locale("ar", "iq");
        NumberFormat f5 = NumberFormat.getCurrencyInstance(l2);
        String v6 = f5.format(n);
        System.out.println("Dinheiro Boom!:" + v6);
        
        NumberFormat f6 = NumberFormat.getCurrencyInstance(Locale.JAPAN);
        String v7 = f6.format(n);
        System.out.println("Dinheiro Japao:" + v7);
    }
    
}

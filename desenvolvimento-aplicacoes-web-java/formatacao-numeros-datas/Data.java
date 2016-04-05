package javaapplication3;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Data {
    public static void main(String[] args) {
        Date d = new Date();
        System.out.println("Data atual:" + d);
        System.out.println("Data atual:" + d.getTime());
        
        Calendar c = Calendar.getInstance();
        System.out.println("Hoje é:" + c.get(Calendar.DAY_OF_YEAR));
        c.add(Calendar.DAY_OF_YEAR, 2);
        System.out.println("Mais 2 dias:" + c.get(Calendar.DAY_OF_YEAR));
        
        DateFormat df = DateFormat.getDateInstance(DateFormat.FULL);
        System.out.println("Data formatada: " + df.format(c.getTime()));
        
        SimpleDateFormat sdf = new SimpleDateFormat("d/MM/yyyy");
        try {
            Date d1 = sdf.parse("01/04/2015");
            System.out.println(df.format(d1));
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        
    }
}

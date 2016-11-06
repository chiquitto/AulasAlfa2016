package Marca;

import java.util.ArrayList;

public class Marcas extends ArrayList<Marca> {

    public Marcas() {
        this.add(new Facebook());
        this.add(new Github());
        this.add(new Instagram());
        this.add(new Skype());
        this.add(new Twitter());
        this.add(new Youtube());
    }
    
}

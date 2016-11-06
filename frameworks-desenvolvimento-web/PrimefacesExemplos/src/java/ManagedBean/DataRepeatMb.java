package ManagedBean;

import Marca.Marcas;
import javax.faces.bean.ManagedBean;

@ManagedBean
public class DataRepeatMb {
    private Marcas marcas = new Marcas();

    public Marcas getMarcas() {
        return marcas;
    }

    public void setMarcas(Marcas marcas) {
        this.marcas = marcas;
    }
    
}

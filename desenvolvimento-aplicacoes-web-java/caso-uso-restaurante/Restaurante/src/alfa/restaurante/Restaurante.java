package alfa.restaurante;

import java.util.ArrayList;
import java.util.List;

public class Restaurante {
    List<Mesa> mesas = new ArrayList<>();
    
    public Restaurante() {
    }
    
    public int abrirMesa() {
        Mesa m = new Mesa();
        
        mesas.add(m);
        
        return (mesas.size() - 1);
    }
    
    public Mesa getMesa(int id) {
        return mesas.get(id);
    }
    
}

package ManagedBean;

import Marca.Marca;
import Marca.Marcas;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import org.primefaces.event.TransferEvent;
import org.primefaces.model.DualListModel;

@ManagedBean
public class DataPickListMb {
    
    private DualListModel<Marca> marcas = new DualListModel<>();
    
    @PostConstruct
    public void init() {
        List<Marca> marcasNaoSelecionadas = new Marcas();
        List<Marca> marcasSelecionadas = new ArrayList<>();
        
        marcas.setSource(marcasNaoSelecionadas);
        marcas.setTarget(marcasSelecionadas);
    }

    public DualListModel<Marca> getMarcas() {
        return marcas;
    }

    public void setMarcas(DualListModel<Marca> marcas) {
        this.marcas = marcas;
    }
    
    public void manipularTransfer(TransferEvent event) {
        // Mostrar os itens que foram transferidos
        for (Object o : event.getItems()) {
            String nome = (String) o;
            FacesMessage msg;
            
            if (event.isAdd()) {
                msg = new FacesMessage("Item adicionado", nome);
            } else {
                msg = new FacesMessage("Item removido", nome);
            }
            
            FacesContext context = FacesContext.getCurrentInstance();
            context.addMessage(null, msg);
        }
    }

}

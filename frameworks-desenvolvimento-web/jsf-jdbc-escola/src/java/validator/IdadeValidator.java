package validator;

import java.util.Calendar;
import java.util.Date;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

@FacesValidator("idadeValidator")
public class IdadeValidator implements Validator {

    @Override
    public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException {
        Calendar nasc = Calendar.getInstance();
        nasc.setTime((Date) value);
        nasc.add(Calendar.YEAR, 18);
        
        Calendar hoje = Calendar.getInstance();
        
        if (hoje.before(nasc)) {
            FacesMessage msg = new FacesMessage("Idade mínima é 18 anos");
            msg.setSeverity(FacesMessage.SEVERITY_ERROR);
            throw new ValidatorException(msg);
        }
    }
    
}

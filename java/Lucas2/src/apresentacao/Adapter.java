/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author iapereira
 */
public class Adapter implements SMSSender {
    private EnviadorSMS enviadorSMS;
    
    public Adapter(EnviadorSMS enviadorSMS){
        this.enviadorSMS =  enviadorSMS;
    }

    @Override
    public boolean sendSMS(SMS sms) {
        
        String msgs[] = new String[1];
        msgs[0] = sms.getTexto();
        
        try {
            this.enviadorSMS.enviadorSMS(sms.getOrigem(), sms.getDestino(), msgs);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(Adapter.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
    }
    
}

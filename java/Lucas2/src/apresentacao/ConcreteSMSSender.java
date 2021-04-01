/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

/**
 *
 * @author iapereira
 */
public class ConcreteSMSSender implements SMSSender {

    @Override
    public boolean sendSMS(SMS sms) {
        System.out.println("Enviando...");     
        System.out.println(sms.getOrigem());
        System.out.println(sms.getDestino());
        System.out.println(sms.getTexto());
        return true;
    }
    
}

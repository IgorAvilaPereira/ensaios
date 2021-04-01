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
public class SMSSenderConcrete implements SMSSender {

    @Override
    public void sendSMS(SMS sms) {
        System.out.println("Enviando de vez..."+sms.getTexto());
    }

  
    
}

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
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        
        SMS sms = new SMS();
        sms.setOrigem("igor");
        sms.setDestino("lucas");
        sms.setTexto("texto");
        
        SMSSender mSSender = new ConcreteSMSSender();
        mSSender.sendSMS(sms);
        
        System.out.println("======================");
        
        
        EnviadorSMS enviadorSMS = new ConcreteEnviadorSMS();
        enviadorSMS.enviadorSMS("igor", "lucas", new String[]{"tex", "to"});
        
        System.out.println("=================");
        
        Adapter a = new Adapter(enviadorSMS);
        a.sendSMS(sms);
        
    }
    
}

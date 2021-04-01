/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Facade;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import negocio.Time;
import persistencia.TimeDAO;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
       Facade facade = new Facade();
       facade.inserir(JOptionPane.showInputDialog(null, "Digite o nome:", "Facade", JOptionPane.INFORMATION_MESSAGE), JOptionPane.showInputDialog(null, "Digite o endereco:", "Facade", JOptionPane.INFORMATION_MESSAGE));
         
       
       SMSSender smsSender = new SMSSenderConcrete();
       smsSender.sendSMS(new SMS("9999999999", "8888888", "ijsdahfiusadhfuasdfhsaiudofhusaiofhasdufioashdu"));
      
       
       EnviadorSMS enviadorSMS = new EnviadorSMSConcrete();
       enviadorSMS.enviarSMS("999999","DFDSFSDF", new String[]{"sdfsdfsdf", "sdfsdfsdf"});
       
       
      SMSSenderAdapter smssoiajdsioad = new SMSSenderAdapter(enviadorSMS);
      smsSender.sendSMS(new SMS("9999999999", "8888888", "ijsdahfiusadhfuasdfhsaiudofhusaiofhasdufioashdu"));
      
    
    }
    
}

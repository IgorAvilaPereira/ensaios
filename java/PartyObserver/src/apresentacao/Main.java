/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.ArrayList;
import negocio.Convidado;
import negocio.Observer;
import negocio.Party;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Party party = new Party();        
        party.subscribe(new Convidado("Igor"));         
        party.subscribe(new Convidado("Fernando"));        
        party.setComLuz(false);
        System.out.println("===============================");
        party.subscribe(new Convidado("Israel"));
        party.setComLuz(true);
      
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.facade.SaunaFacade;
import negocio.sauna.Cliente;
import negocio.sauna.Garota;
import negocio.sauna.Sauna;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        SaunaFacade saunaFacade = new SaunaFacade();
        Cliente clienteExcepcional = new Cliente();
        clienteExcepcional.setApelido("Bengala");
        saunaFacade.addCliente(clienteExcepcional);
        saunaFacade.comecaSacanagem();
        
      
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Pessoa;
import negocio.SecretariaEletronica;
import negocio.Telefone;

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
        Telefone telefone = new Telefone();
        telefone.registerObserver(new Pessoa());
        telefone.registerObserver(new SecretariaEletronica());       
        telefone.setState(true);
        
    }
    
}

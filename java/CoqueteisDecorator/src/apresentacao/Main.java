/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Coquetel;
import negocio.Rum;
import negocio.Suco;

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
        Coquetel sucorum = new Rum();
       // sucorum = new Suco(sucorum);
        System.out.println(sucorum.getNome());
        System.out.println(sucorum.getPreco());
        System.out.println("===================");
    }
    
}

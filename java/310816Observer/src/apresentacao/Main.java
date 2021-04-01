/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Gostosa;
import negocio.Painel;
import negocio.Veio;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Painel painel = new Painel();
        painel.subcribe(new Veio());
        painel.subcribe(new Gostosa());
        System.out.println("Geral foi notificado");
        painel.setStateWork(4);
        System.out.println("===================");
        System.out.println("Removi o Veio");
        System.out.println("======================");
        System.out.println("Só gostosa...");
        painel.setStateWork(5);
        //painel.notifyObservers();
   }
    
}

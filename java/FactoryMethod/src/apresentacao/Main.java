/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.BigRiverPizzaStore;
import negocio.Pizza;
import negocio.PizzaStore;

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
        PizzaStore bigRiverStore = new BigRiverPizzaStore();
        Pizza negaMaluca = bigRiverStore.orderPizza("nega_maluca");
        
        
    }
    
}

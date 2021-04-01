/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Beverage;
import negocio.Limao;
import negocio.Milk;
import negocio.Vodka;

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
        
        Beverage beverage  = new Vodka();
        // ainda vodka  = vodka + com limao
        beverage = new Limao(beverage);
        beverage = new Milk(beverage);
        System.out.println(beverage.getDescription());
        System.out.println("Custo:"+beverage.cost());
        
        
       
        
    }
    
}

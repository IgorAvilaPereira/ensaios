/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Beverage;
import negocio.Decaf;
import negocio.Espresso;
import negocio.Milk;
import negocio.Mocha;
import negocio.Tea;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        // so temos um espresso
        Beverage bebida = new Espresso();
        System.out.println("Original:"+bebida.getDescription());
        System.out.println("Custo:"+bebida.cost());
        System.out.println("=================");
        
        bebida = new Milk(bebida);
        System.out.println("Expresso C/Leite:"+bebida.getDescription());
        System.out.println("Custo:"+bebida.cost());
        System.out.println("=================");
        
        bebida = new Mocha(bebida);
        System.out.println("Expresso C/Leite e Mocha:"+bebida.getDescription());
        System.out.println("Custo:"+bebida.cost());
        System.out.println("=================");
        
        
        Beverage tea = new Tea();
        tea = new Mocha(tea);
        System.out.println("Chá com mocha:"+tea.getDescription());
        System.out.println("Custo:"+tea.cost());
        System.out.println("=================");
    }
    
}

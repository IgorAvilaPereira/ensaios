/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aula_builder;

import negocio.Pizza;

/**
 *
 * @author iapereira
 */
public class Aula_Builder {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        // bonito.
        Pizza pizzaQueijo_bonito = new Pizza.Builder(10).queijo().build();
        System.out.println(pizzaQueijo_bonito);
        // feio
        Pizza pizzaQueijo_feio = new Pizza(10, true, false, false);
        System.out.println(pizzaQueijo_feio);
    }
    
}

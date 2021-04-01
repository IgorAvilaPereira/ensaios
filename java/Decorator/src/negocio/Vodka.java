/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author iapereira
 */
public class Vodka extends Beverage {
    
    public Vodka(){
        super();
        super.description = "Vodka";
    }

    @Override
    public double cost() {
        return 200.0;
    }
    
}

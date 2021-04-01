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
public class Tea extends Beverage {
    
    public Tea(){
        this.description = "Tea (1.5) " ;
    }

    @Override
    public double cost() {
        return 1.5;
    }
    
    
}

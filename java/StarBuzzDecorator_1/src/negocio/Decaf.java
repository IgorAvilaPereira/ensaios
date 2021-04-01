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
public class Decaf extends Beverage {
    
    public Decaf (){
        this.description = "Descafeinado (2.0)";
    }

    @Override
    public double cost() {
        return 2.0;
    }
    
}

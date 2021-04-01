/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.beverages;

import negocio.Beverage;

/**
 *
 * @author iapereira
 */
public class Decaf extends Beverage {
    
    public Decaf(){
        super();
        super.description = "Descafeinado";
    }

    @Override
    public double cost() {
        return 3.5;
    }
    
     @Override
    public double qtde() {
        return 0;
    }
    
}

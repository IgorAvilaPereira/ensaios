/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.condiment;

import negocio.Beverage;
import negocio.CondimentDecorator;

/**
 *
 * @author iapereira
 */
public class Mocha extends CondimentDecorator {
    Beverage beverage;
    
    public Mocha(Beverage beverage){
        super();
        this.beverage  = beverage;
    }

    @Override
    public String getDescription() {
        return this.beverage.getDescription() + "\n" + "Mocha";
    }

    @Override
    public double cost() {
        return this.beverage.cost() + 200;
    }
    
    @Override
    public double qtde() {
        return this.beverage.qtde() + 1;
    }
    
}

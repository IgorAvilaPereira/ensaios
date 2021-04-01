/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.condiment;

import negocio.CondimentDecorator;
import negocio.Beverage;

/**
 *
 * @author iapereira
 */
public class Milk extends CondimentDecorator {
    Beverage beverage;
    
    public Milk(Beverage beverage){
        super();
        this.beverage = beverage;
    }

    @Override
    public String getDescription() {
        return this.beverage.getDescription() + "\n" + "Milk";
    }

    @Override
    public double cost() {
        return this.beverage.cost() + 1.0;
    }

    @Override
    public double qtde() {
        return this.beverage.qtde() + 1;
    }
    
    
    
    
}

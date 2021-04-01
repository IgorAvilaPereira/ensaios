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
public class Milk extends CondimentDecorator {

    public Milk(Beverage beverage){        
        this.component = beverage;
    }
    
    @Override
    public String getDescription() {
        return this.component.getDescription() + ", Milk (1.0)";    
    }

    @Override
    public double cost() {
        return this.component.cost() + 1.0;
    }
    
}

package negocio.condiment;

import negocio.Beverage;
import negocio.CondimentDecorator;

/**
 *
 * @author iapereira
 */
public class Sugar extends CondimentDecorator {

    Beverage beverage;
    

    public Sugar(Beverage beverage) {
        super();        
        this.beverage = beverage;
    }

    
   @Override
    public String getDescription() {
        return this.beverage.getDescription() + "\n" + "Sugar";
    }

    @Override
    public double cost() {
        return this.beverage.cost() + 0.5;
    }
    
    @Override
    public double qtde() {
        return this.beverage.qtde() + 1;
    }
    
}

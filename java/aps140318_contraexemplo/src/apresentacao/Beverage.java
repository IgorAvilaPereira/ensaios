/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public abstract class Beverage {

    protected String description;
    protected ArrayList<Ingrediente> condiments;

    public Beverage() {
        this.condiments = new ArrayList();
    }

    public String getDescription() {
        String d = this.description;
        for (int i = 0; i < condiments.size(); i++) {
            Ingrediente ingrediente = condiments.get(i);
            d += ingrediente.getNome() + "\n";
            
        }
        return d;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public abstract double cost();

    public void addCondiment(Ingrediente ingrediente) {
        this.condiments.add(ingrediente);
    }
    
    public double totalCost(){
        double d = this.cost();
        for (int i = 0; i < condiments.size(); i++) {
            Ingrediente ingrediente = condiments.get(i);
            d += ingrediente.custo();
            
        }
        return d;
    }
    
    

}

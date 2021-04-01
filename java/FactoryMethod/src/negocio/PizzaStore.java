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
public abstract class PizzaStore {
    
    
    public final Pizza orderPizza(String type){
        // create eh o metodo responsavel pela criacao de objetos de pizza. CAda subclasse eh responsavel por especializar o tipo de pizza e também, caso necessário,  o modo de preparo 
        Pizza pizza = createPizza(type);
        pizza.prepare(); // vai chamar o metodo especializada da negamaluca style
        pizza.bake();
        pizza.cut();
        pizza.box();
        return pizza;
    }
            
            
   protected abstract Pizza createPizza(String type);
    
}

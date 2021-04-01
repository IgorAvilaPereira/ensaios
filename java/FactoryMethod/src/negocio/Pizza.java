/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public abstract class Pizza {
    String name;
    String dough;
    String sauce;
    ArrayList toppings = new ArrayList();
    
    
    void prepare(){
        System.out.println("Preparing  " + name);
        System.out.println("Tossing dough.....");
        System.out.println("Adding sauce......");
        System.out.println("Adding toppings:");
        for (int i = 0; i < toppings.size(); i++) {
            System.out.println(toppings.get(i));            
        }
    }
    
    void bake(){
        System.out.println("Bake for 25 minutes at 350");
    }
            
    
    void cut(){
        System.out.println("Cutting the into diagonal alices");
    }
    
    
    void box(){
        System.out.println("Place pizza in official PizzaStore box");
    }
    
    public String getName(){
        return name;
    }
           
    
}

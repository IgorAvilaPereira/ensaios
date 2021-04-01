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
public class BigRiverStyleNegaMalucaPizza extends Pizza {

    public BigRiverStyleNegaMalucaPizza() {
        name =  "Nega maluca";
        dough = "com borda de chocolate branco";
        sauce = "doce de leite";
        toppings.add("chocolate");
        toppings.add("doce de leite");
    }
    
    @Override
    void prepare(){
        super.prepare();
        System.out.println("Preparando de forma rio grandina - com mini borda");
    }
    
}

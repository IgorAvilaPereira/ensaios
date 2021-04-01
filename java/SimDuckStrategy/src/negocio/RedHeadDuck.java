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
public class RedHeadDuck extends Duck {
    
    

    @Override
    public void display() {
        System.out.println("Cabeça Vermelha.");
        System.out.println("Voando...");
        super.performFly();
        System.out.println("Grasnando...");
        super.performQuack();
    }
    
    
    
}

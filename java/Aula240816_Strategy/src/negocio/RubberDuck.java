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
public class RubberDuck extends Duck {

    @Override
    public void display() {
        System.out.println("RubberDuck");
        System.out.println("Quack:");
        super.performQuack();
        System.out.println("Fly:");
        super.performFly();
    }
    
}

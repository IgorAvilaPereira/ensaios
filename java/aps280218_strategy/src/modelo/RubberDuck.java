/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author iapereira
 */
public class RubberDuck extends Duck {
    //
    public RubberDuck(){
        super();
        super.setFlyBehavior(new FlyNoWay());
        super.setQuackBehavior(new Squeak());
    }

    @Override
    public void display() {
        System.out.println("Pato de Borracha...");
        super.performFly();
        super.performQuack();
    }
    
}

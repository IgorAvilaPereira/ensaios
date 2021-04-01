/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import negocio.quackbehaviors.QuackBehavior;
import negocio.flybehaviors.FlyBehavior;

/**
 *
 * @author iapereira
 */
public abstract class Duck {
    private FlyBehavior flyBehavior;
    private QuackBehavior quackBehavior;
    
    public void swim(){
        System.out.println("Pato Nadando...");
    }
    
    public void performQuack(){
        this.quackBehavior.quack();
    }
    
    public void performFly(){
        this.flyBehavior.fly();
    }

    public FlyBehavior getFlyBehavior() {
        return flyBehavior;
    }

    public void setFlyBehavior(FlyBehavior flyBehavior) {
        this.flyBehavior = flyBehavior;
    }

    public QuackBehavior getQuackBehavior() {
        return quackBehavior;
    }

    public void setQuackBehavior(QuackBehavior behavior) {
        this.quackBehavior = behavior;
    }
    
    public abstract void display();
    
    
    
}

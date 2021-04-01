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
public abstract class Duck {
    private FlyBehavior flyBehavior;
    private QuackBehavior quackBehavior;
    
    public Duck(){
        this.flyBehavior = new FlyNoWay();
        this.quackBehavior = new MuteQuack();
    }
    
    public void swim(){
        System.out.println("Nadando...");
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

    public void setQuackBehavior(QuackBehavior quackBehavior) {
        this.quackBehavior = quackBehavior;
    }
    
    public void performQuack(){
        this.quackBehavior.quack();
    }
    
    public void performFly(){
        this.flyBehavior.fly();
    }   
    
    public abstract void display();
    
}

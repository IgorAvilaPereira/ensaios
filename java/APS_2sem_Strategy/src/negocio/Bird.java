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
public abstract class Bird {
    private FlyBehavior flyBehavior;
    
    public Bird(){
        this.flyBehavior = new FlyWithWings();
    }
    
    public abstract void display();

    public void performFly() {
        this.flyBehavior.fly();
    }

    public void setFlyBehavior(FlyBehavior flyBehavior) {
        this.flyBehavior = flyBehavior;
    }
    
    
    
}

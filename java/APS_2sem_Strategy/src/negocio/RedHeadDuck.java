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
    
    public RedHeadDuck(){
        super();
        super.setFlyBehavior(new FlyWithWings());
        super.setQuackBehavior(new Quack());
    }

    @Override
    public void display() {
        System.out.println("Sou cabeça vermelha #porno");
        super.performFly();
        super.performQuack();
    }
    
}

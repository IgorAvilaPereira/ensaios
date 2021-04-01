/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.flybehaviors.FlyFly;
import negocio.flybehaviors.FlyNoWay;
import negocio.flybehaviors.FlyWithWings;
import negocio.MallardDuck;
import negocio.quackbehaviors.Quack;
import negocio.RubberDuck;
import negocio.quackbehaviors.Squeak;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println("==============");
        System.out.println("Criando um mallard");
        MallardDuck mallardDuck = new MallardDuck();
        mallardDuck.setFlyBehavior(new FlyWithWings());
        mallardDuck.setQuackBehavior(new Quack());
        mallardDuck.display();
        
        System.out.println("===============");
        System.out.println("mudei o comportamento de voo");
        // mudei o comportamento de voo
        mallardDuck.setFlyBehavior(new FlyNoWay());
        mallardDuck.display();
        System.out.println("===============");
        System.out.println("Criando um pato de borracha");
        RubberDuck rubberDuck = new RubberDuck();
        rubberDuck.setQuackBehavior(new Squeak());
        //rubberDuck.setFlyBehavior(new FlyNoWay());
        rubberDuck.setFlyBehavior(new FlyFly());
        rubberDuck.display();
    }
    
}

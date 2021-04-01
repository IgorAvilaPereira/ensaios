/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Bird;
import negocio.FlyNoWay;
import negocio.FlyWithWings;
import negocio.Quack;
import negocio.RedHeadDuck;
import negocio.RubberQuack;
import negocio.Squeak;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        RedHeadDuck cabecaVermelha = new RedHeadDuck();
        cabecaVermelha.setFlyBehavior(new FlyWithWings());
        cabecaVermelha.setQuackBehavior(new Quack());
        cabecaVermelha.display();
        System.out.println("================");
        System.out.println("Levou um tiro....");
        cabecaVermelha.setFlyBehavior(new FlyNoWay());
        cabecaVermelha.display();
        System.out.println("==================");
        RubberQuack borracha = new RubberQuack();
        borracha.setFlyBehavior(new FlyNoWay());
        borracha.setQuackBehavior(new Squeak());
        borracha.display();
        System.out.println("==================");
        System.out.println("Passarinho...");
        Bird passarinho = new Bird();   
        passarinho.setFlyBehavior(new FlyWithWings());
        passarinho.getFlyBehavior().fly();
    }
    
}

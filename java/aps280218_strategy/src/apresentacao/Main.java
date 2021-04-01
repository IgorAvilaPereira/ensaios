/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import modelo.FlyNoWay;
import modelo.FlyWithWings;
import modelo.IgorDuck;
import modelo.MuteQuack;
import modelo.Quack;
import modelo.RedHeadDuck;
import modelo.RubberDuck;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Inicio da Simulação...");
        RubberDuck patoBorracha = new RubberDuck();
        patoBorracha.display();
        
        IgorDuck patoIgor = new IgorDuck();
        patoIgor.setFlyBehavior(new FlyWithWings());
        patoIgor.setQuackBehavior(new MuteQuack());
        patoIgor.display();
        
//        RedHeadDuck cabecaVermelha = new RedHeadDuck();
//        cabecaVermelha.setFlyBehavior(new FlyWithWings());
//        cabecaVermelha.setQuackBehavior(new Quack());
//        cabecaVermelha.display();
//        System.out.println("===============================");
//        System.out.println("Acabou de tomar um tiro...");
//        cabecaVermelha.setFlyBehavior(new FlyNoWay());
//        cabecaVermelha.display();
//       
       
        
        
    }
    
}

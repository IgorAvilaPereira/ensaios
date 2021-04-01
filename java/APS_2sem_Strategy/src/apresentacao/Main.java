/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.FlyNoWay;
import negocio.FlyWithWings;
import negocio.GemidaoDoWhatsQuack;
import negocio.PombaRola;
import negocio.Quack;
import negocio.RedHeadDuck;
import negocio.RubberDuck;

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
        RedHeadDuck redHeadDuck = new RedHeadDuck();        
        redHeadDuck.display();
        
        System.out.println("==================");
        
        System.out.println("Cabeça vermelha recebeu um tiro..");
        redHeadDuck.setFlyBehavior(new FlyNoWay());
        
        redHeadDuck.display();
        
        System.out.println("==============");
        
        RubberDuck rubberDuck = new RubberDuck();
        rubberDuck.setQuackBehavior(new GemidaoDoWhatsQuack());
        rubberDuck.display();
        
        System.out.println("=================");
        
        PombaRola pombaRola = new PombaRola();
        pombaRola.display();
        
        
    }
    
}

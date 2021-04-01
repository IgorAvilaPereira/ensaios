/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import adapter.TurtleAdapter;
import java.util.ArrayList;
import negocio.Duck;
import negocio.RedHeadDuck;
import negocio.module.Ninja;
import negocio.module.Turtle;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Duck donald =  new RedHeadDuck();
        donald.quack();
        donald.fly();
        
        Turtle rafael =  new Ninja();
        rafael.bip();
        
        TurtleAdapter ninjaAdapter = new TurtleAdapter(rafael);
        ninjaAdapter.quack();
        
        if (ninjaAdapter instanceof Duck){
            System.out.println("Eh um Duck");
        } else {
            System.out.println("Nops....");
        }
        
        ArrayList<Duck> vetDuck = new ArrayList();
        vetDuck.add(donald);
        vetDuck.add(ninjaAdapter);
        for (int i = 0; i < vetDuck.size(); i++) {
            Duck d = vetDuck.get(i);
            d.quack();
            
        }
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Duck;
import negocio.MallardDuck;
import negocio.Turkey;
import negocio.TurkeyAdapter;
import negocio.WildTurkey;

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
        Duck duck = new MallardDuck();
        duck.fly();
        duck.quack();
        
        Turkey turkey = new WildTurkey();
        //turkey.fly();
        //turkey.gobble();
        
        TurkeyAdapter turkeyAdapter = new TurkeyAdapter(turkey);
        turkeyAdapter.fly();
        turkeyAdapter.quack();
        
        if (duck instanceof Duck){
            System.out.println("Sim duck eh duck");
        }
        
        if (turkeyAdapter instanceof Duck){
            System.out.println("Turkey tb eh visto com Duck");
        } else {
            System.out.println("Nops...");
        }
        
    }
    
}

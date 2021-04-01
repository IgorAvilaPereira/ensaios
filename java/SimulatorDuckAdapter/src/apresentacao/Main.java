/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.MallardDuck;
import negocio.WildTurkey;
import negocio.TurkeyAdapter;
import negocio.Duck;
import negocio.Turkey;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("=================");
        Duck mallardDuck = new MallardDuck();
        System.out.println("::Duck::");
        mallardDuck.quack();
        mallardDuck.fly();
        System.out.println("=================");
        Turkey wildTurkey = new WildTurkey();
        System.out.println("::Turkey::");
        wildTurkey.fly();
        wildTurkey.gooble();
        System.out.println("===============");
        System.out.println("::Turkey Adapter::");
        TurkeyAdapter turkeyAdapter = new TurkeyAdapter(wildTurkey);
        turkeyAdapter.quack();
        turkeyAdapter.fly();
        System.out.println("=======");
        if (mallardDuck instanceof Duck){
            System.out.println("EH Pato");
        }
        System.out.println("=====");
        if (wildTurkey instanceof Duck){
            System.out.println("WildTurkey eh Pato");
        } else {
            System.out.println("Eh Peru");
        }
        System.out.println("=====");
        if (turkeyAdapter instanceof Duck){
            System.out.println("Enganei o bobo na casca do ovo...");
        }
    }
    
}

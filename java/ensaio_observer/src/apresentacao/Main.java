/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.Time;
import java.util.Timer;
import modelo.DadosSubject;
import modelo.PizzaObserver;
import modelo.LinhaObserver;

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
        
        DadosSubject dadosSubject = new DadosSubject();
        dadosSubject.addObserver(new LinhaObserver());
        dadosSubject.addObserver(new PizzaObserver());        
        dadosSubject.changeState();        
        dadosSubject.changeState();        
        //dadosSubject.changeState();
        //dadosSubject.changeState();
    }
    
}

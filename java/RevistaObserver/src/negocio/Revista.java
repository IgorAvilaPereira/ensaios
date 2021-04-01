/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author iapereira
 */
public class Revista implements Subject{

    private List<Observer> vet;
    private String noticia;
    
    
    public Revista(){
        this.noticia = "nada novo";
        this.vet = new ArrayList();
    }
    
    @Override
    public void registerObserver(Observer observer) {
       vet.add(observer);
        
    }

    @Override
    public void removeObserver(int i) {
        vet.remove(i);
    }

    @Override
    public void notifyObserver() {
          for (int i = 0; i < vet.size(); i++) {
            Observer o = vet.get(i);
            System.out.println("===============");
            o.update(this.noticia);          
            System.out.println("===============");
        }
    }

    @Override
    public void setState(String noticia) {
        this.noticia = noticia;
        notifyObserver();
    }
    
}

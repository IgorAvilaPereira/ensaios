/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public class Party implements Subject {
    ArrayList<Observer> vetObserver;
    boolean comLuz;
    
    
    public Party(){
        this.comLuz = true;
        this.vetObserver = new ArrayList();
    }

    public boolean isComLuz() {
        return comLuz;
    }

    public void setComLuz(boolean comLuz) {        
        if (comLuz != this.comLuz) this.notifySubscribeObserver();
        this.comLuz = comLuz;
        
    }
    
    

    @Override
    public void subscribe(Observer observer) {
        this.vetObserver.add(observer);
       // if (this.vetObserver.size() > 1){
        //    this.notifySubscribeObserver();
       //}
    }

    @Override
    public void unscribe(int pos) {
        //this.notifyUnscribeObserver(this.vetObserver.get(pos));
        this.vetObserver.remove(pos);
    }

    @Override
    public void notifySubscribeObserver() {
        for (int i = 0; i < vetObserver.size(); i++) {
            Observer observer = vetObserver.get(i);
            observer.ocorreuAlgoComALuz(this.comLuz);
            
        }
    }

    @Override
    public void notifyUnscribeObserver(Observer observer) {
        for (int i = 0; i < vetObserver.size(); i++) {
            Observer obs = vetObserver.get(i);
            obs.update();           
        }
    }
    
}

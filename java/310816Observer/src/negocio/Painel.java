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
public class Painel implements Subject {
    private final List<Observer> vetObserver;
    private int stateWork;   
    
    public Painel(){
        this.vetObserver = new ArrayList();
    }
    
    public int getStateWork() {
        return stateWork;
    }

    public void setStateWork(int stateWork) {
        this.stateWork = stateWork;
        this.notifyObservers();
        if (this.vetObserver.size() > 0){
            this.unsubscribe(0);
        }
    }
    
    @Override
    public void subcribe(Observer observer) {
        this.vetObserver.add(observer);
    }

    @Override
    public void unsubscribe(int i) {
        this.vetObserver.remove(i);
    }

    @Override
    public void notifyObservers() {
        for (int i = 0; i < vetObserver.size(); i++) {
            Observer ob = vetObserver.get(i);
            ob.update(this.stateWork);            
        }
    }
    
}

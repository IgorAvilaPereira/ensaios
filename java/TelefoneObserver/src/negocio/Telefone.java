package negocio;

import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author iapereira
 */
public class Telefone implements Subject {
    private List<Observer> vetObserver;
    private boolean taTocando;
    
    public Telefone(){
        this.taTocando = false;
        this.vetObserver = new ArrayList();
    }

    @Override
    public void registerObserver(Observer observer) {
        this.vetObserver.add(observer);
    }

    @Override
    public void removeObserver(int i) {
        this.vetObserver.remove(i);
    }

    @Override
    public void notifyObserver() {
        for (int i = 0; i < vetObserver.size(); i++) {
            Observer o = vetObserver.get(i);
            System.out.println("===============");
            o.update(this.taTocando);          
            System.out.println("===============");
        }
    }

    @Override
    public void setState(boolean tocando) {
        if (tocando){
            this.taTocando = tocando;
            this.notifyObserver();
        }
    }
    
}

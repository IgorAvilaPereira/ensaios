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
public class Leiloeiro implements Subject {

    private String nome;
    private ArrayList<Observer> participantes;

    private Observer ganhador;

    public Leiloeiro() {
        this.participantes = new ArrayList();
        this.ganhador = null;
    }

    public Observer getGanhador() {
        return ganhador;
    }

    public void setGanhador(Observer ganhador) {
        this.ganhador = ganhador;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

   
    @Override
    public void addObserver(Observer observer) {
        this.participantes.add(observer);
        if (this.ganhador != null) {
            if (observer.lance() > this.ganhador.lance()) {
                this.ganhador = observer;
                this.notifyObservers(this.ganhador);
            }
        } else {
            this.ganhador = observer;
            //this.notifyObservers(this.ganhador);
        }

    }

    @Override
    public void removerObserver(int i) {
        this.participantes.remove(i);
        //this.notifyObservers(this.participantes.get(i), false);
    }

    @Override
    public void removerObserver(Observer observer) {
        this.participantes.remove(observer);
        //this.notifyObservers(observer, false);

    }

    @Override
    public void notifyObservers(Observer observer) {
        for (int i = 0; i < participantes.size(); i++) {
            Observer participante = participantes.get(i);
            participante.update(observer);
        }
    }
}

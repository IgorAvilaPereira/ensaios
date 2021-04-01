/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.ArrayList;

/**
 *
 * @author Anderson Zamberlan
 */
public class Leiloeiro implements Subject {

    private final ArrayList vetObserver;
   
    private double lanceVencedor;
    private String participanteVencedor;
    

    public Leiloeiro() {
        this.vetObserver = new ArrayList();

    }

   

    public void novoLance(double lance, String participante) {
        if (lance > lanceVencedor){
            this.lanceVencedor = lance;
            this.participanteVencedor = participante;
        }
        this.notifyObservers(lance, participante);

    }

    public double getLanceVencedor() {
        return lanceVencedor;
    }

    public void setLanceVencedor(double lanceVencedor) {
        this.lanceVencedor = lanceVencedor;
    }

    public String getParticipanteVencedor() {
        return participanteVencedor;
    }

    public void setParticipanteVencedor(String participanteVencedor) {
        this.participanteVencedor = participanteVencedor;
    }

    @Override
    public void subcribe(Observer observer) {
        this.vetObserver.add(observer);
    }

    @Override
    public void notifyObservers(double lance, String participante) {
        for (int i = 0; i < vetObserver.size(); i++) {
            Observer ob = (Observer) vetObserver.get(i);
            ob.update(lance, participante);
        }
    }
}

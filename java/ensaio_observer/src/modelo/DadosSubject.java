package modelo;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author iapereira
 */
public class DadosSubject implements Subject {
    private final List<Observer> observers;
    private final Dados dados;
    
    public DadosSubject(){
        this.observers = new ArrayList();
        this.dados = new Dados();
    }

    @Override
    public void addObserver(Observer o) {
        this.observers.add(o);
    }

    @Override
    public void notifyObservers() {
        this.observers.forEach((o) -> {
            o.update(dados);
        });
    }

    @Override
    public void changeState() {
        this.dados.setA(Math.random()*100);
        this.dados.setB(Math.random()*100);
        this.dados.setC(Math.random()*100);
        this.notifyObservers();
    }

    @Override
    public void removeObserver(int i) {
        this.observers.remove(i);
    }
    
}

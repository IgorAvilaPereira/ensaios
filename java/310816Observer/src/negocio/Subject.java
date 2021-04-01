/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author iapereira
 */
public interface Subject {
    void subcribe(Observer observer);
    void unsubscribe(int i);
    void notifyObservers();
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author iapereira
 */
public interface Subject {
    void changeState();
    void addObserver(Observer o);
    void removeObserver(int i);
    void notifyObservers();
    
}

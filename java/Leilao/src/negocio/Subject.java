/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author Anderson
 */
public interface Subject {
    void subcribe(Observer observer);
    void notifyObservers(double lance, String participante);
    
}

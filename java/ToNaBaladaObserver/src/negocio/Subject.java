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
    // cadastra um outro observador como observador do observavel (festa)
    public void addObserver(Observer observer);    
    
    public void removerObserver(int i);
    // metodo sugestao Roger
    public void removerObserver(Observer observer);
    
    // metodo que notifica todos os observadores
    public void notifyObservers();   
}

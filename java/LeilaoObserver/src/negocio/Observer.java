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
public interface Observer {
    public void update(Observer observer);  
    public String getNome();
    public double lance();
    public void darLance(double lance);

}

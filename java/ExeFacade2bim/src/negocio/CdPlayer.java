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
public class CdPlayer {
    private Amplificador amplificador;
    
    public CdPlayer (){
        
    }
    
    public void on(){
        System.out.println("Ligando o CdPlayer...");
    }
    
    public void off(){
        System.out.println("Desligando o CdPlayer....");
    }
    
    public void eject(){
        System.out.println("Ejetando o CdPlayer...");
    }
    
    public void pause(){
        System.out.println("Pausando o CdPlayer...");
    }
    
    public void stop(){
        System.out.println("Stopping o CdPlayer...");
    }
            
    
}

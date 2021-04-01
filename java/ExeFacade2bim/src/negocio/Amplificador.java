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
public class Amplificador {
    private Tuner tuner;
    private DvdPlayer dvdPlayer;
    private CdPlayer cdPlayer;
    private int volume;

    public void setTuner(Tuner tuner) {
        this.tuner = tuner;
    }

 

    public void setCdPlayer(CdPlayer cdPlayer) {
        this.cdPlayer = cdPlayer;
    }
    
    public void setVolume(int volume){
        this.volume = volume;        
    }
       
    public void on(){
        System.out.println("Ligando o Amplificador...");
    }
    
    public void off(){
        System.out.println("Desligando o Amplificador...");
        
    }
     
    public void setStereoSound(){
        
    }
    
    public void setSurroundSound(){
        
    }

    public void setDvd(DvdPlayer dvd) {
        this.dvdPlayer = dvd;
    }
    
  
}

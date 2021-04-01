/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package devices;

/**
 *
 * @author iapereira
 */
public class Tv {
    private int channel;
    private int volume;
    
    public void on(){
        System.out.println("Tv está sendo ligada");
    }
    
    public void off(){
        System.out.println("Tv está sendo desligada");
    }
    
    public void setInputChannel(int channel){
        this.channel = channel;
        System.out.println("Mudando o canal da tv:"+this.channel);
    }
    
    public void setVolume(int newVolume){
        this.volume = volume;
        System.out.println("Novo volume:"+this.volume);
    }
    
    
    
    
}

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
public class DvdPlayer {
    private Amplificador amplificador;
    
    public void on(){
        System.out.println("Ligando o DVDPlayer...");
    }
    public void off(){
        System.out.println("Desligando o DvdPlayer...");
    }
    
    public void eject(){
        System.out.println("Ejetando o DvdPlayer");
    }
    public void pause(){
        System.out.println("Pausando o DvdPlayer...");
    }
    public void setSurroundAudio(){
        System.out.println("Habilitando o Audio");
    }
    public void setTwoChannelAudio(){
        System.out.println("Habilitando segundo canal de Audio..");
    }
    public void stop(){
        System.out.println("Parando o DvdPlayer...");
    }

    public void play() {
        System.out.println("Tocando o dvd");
    }

   
}

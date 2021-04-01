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
public class Projetor {
    private DvdPlayer dvdPlayer;
    
    public void on(){
        System.out.println("Ligando o Projetor");
    }
    public void off(){
        System.out.println("Desligando o Projetor");
    }
    public void tvModel(){
        System.out.println("Habilitando modo tv...");
    }
    public void wideScreenMode(){
        System.out.println("Habilitando tela Screen...");
    }

    public void setInput(DvdPlayer dvd) {
        this.dvdPlayer = dvd;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import javax.swing.JOptionPane;

/**
 *
 * @author iapereira
 */
public class Tv {

    private int channel;
    private int volume;

    public Tv() {
        this.channel = 9;
        this.volume = 20;
    }

    public void on() {
        JOptionPane.showMessageDialog(null, "Ligando a tv", "Command", JOptionPane.INFORMATION_MESSAGE);
        //System.out.println();
    }

    public void off() {
        //System.out.println("Desligando a tv");
        JOptionPane.showMessageDialog(null, "Desligando a tv", "Command", JOptionPane.INFORMATION_MESSAGE);

    }

    public void setInputChannel(int channel) {
        this.channel = channel;
        System.out.println("Trocando para o canal:" + this.channel);
    }

    public void increaseVolume() {
        this.volume = this.volume + 1;
        System.out.println("Aumentando o volume");
        System.out.println("Volume atual:" + this.volume);
        JOptionPane.showMessageDialog(null, "Aumentando o volume \n Volume atual:" + this.volume, "Command", JOptionPane.INFORMATION_MESSAGE);

    }

    public void decreaseVolume() {
        this.volume = this.volume - 1;
        System.out.println("Diminuindo o volume...");
        System.out.println("Volume atual:" + this.volume);

    }

    public void infoChannel() {
        System.out.println("Canal Atual:" + this.channel);
        JOptionPane.showMessageDialog(null, "Canal Atual:" + this.channel, "Command", JOptionPane.INFORMATION_MESSAGE);

    }

}

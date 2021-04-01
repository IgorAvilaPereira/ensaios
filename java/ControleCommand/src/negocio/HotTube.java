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
public class HotTube {

    private int temperature;

    public void circulate() {
        System.out.println("Circulando...");
        JOptionPane.showMessageDialog(null, "Circulando...", "Command", JOptionPane.INFORMATION_MESSAGE);

    }

    public void jetsOn() {
        System.out.println("Ligando os jatos...");
        JOptionPane.showMessageDialog(null, "Ligando os jatos...", "Command", JOptionPane.INFORMATION_MESSAGE);

    }

    public void jetsOff() {
        System.out.println("Desligando os jatos...");
        JOptionPane.showMessageDialog(null, "Desligando os jatos...", "Command", JOptionPane.INFORMATION_MESSAGE);

    }

    public void setTemperature(int temperature) {
        this.temperature = temperature;
        System.out.println("Mudando para temperatura :" + this.temperature);
    }
}

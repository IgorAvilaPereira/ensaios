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
public class Light {

    public void on() {
        System.out.println("Ligando a luz...");
        JOptionPane.showMessageDialog(null, "Ligando...a luz...", "Command", JOptionPane.INFORMATION_MESSAGE);

    }

    public void off() {
        System.out.println("Desligando a luz...");
        JOptionPane.showMessageDialog(null, "Desligando a luz...", "Command", JOptionPane.INFORMATION_MESSAGE);

    }

}

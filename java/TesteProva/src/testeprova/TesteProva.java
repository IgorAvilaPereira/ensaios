/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testeprova;

import javax.swing.JOptionPane;

/**
 *
 * @author iapereira
 */
public class TesteProva {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String login = JOptionPane.showInputDialog("Digite seu login:");
        JOptionPane.showMessageDialog(null, "Você digitou:"+login, "Sistema", JOptionPane.INFORMATION_MESSAGE);
    }
    
}

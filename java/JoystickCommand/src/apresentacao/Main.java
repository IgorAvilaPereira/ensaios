/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.AFutebol;
import negocio.BFutebol;
import negocio.Futebol;
import negocio.Joystick;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Joystick joystick = new Joystick();
        Futebol futebol = new Futebol();
        joystick.setA(new AFutebol(futebol));
        joystick.setB(new BFutebol(futebol));
        joystick.botaoAPressionado();
        joystick.botaoBPressionado();
    }
    
}

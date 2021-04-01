/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Light;
import negocio.LightOnCommand;
import negocio.SimpleRemoteControl;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
            SimpleRemoteControl control = new SimpleRemoteControl();
            control.setCommand(new LightOnCommand(new Light()));
            control.buttonWasPressed();
            control.buttonWasUnpressed();
    }
    
}

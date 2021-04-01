/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;


import command.*;

/**
 *
 * @author iapereira
 */
public class SimpleRemoteControl {
    Command command;

    void setCommand(Command newCommand) {
        this.command = newCommand;
    }

    void buttonWassPressed() {
        this.command.execute();
    }
    
}

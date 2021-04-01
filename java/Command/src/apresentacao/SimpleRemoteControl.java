/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import command.Command;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author iapereira
 */
public class SimpleRemoteControl {

    private Command commands[];
    private Command undoCommands[];

    public SimpleRemoteControl() {
        
        this.commands = new Command[7];
        
        this.undoCommands = new Command[7];
        
        for (int i = 0; i < commands.length; i++) {
            this.undoCommands[i] = new NoCommand();
            this.commands[i] =  new NoCommand();
        }
    }

    public void addCommand(int slot, Command command) {
        this.commands[slot] = command;
    }

    public void buttonWasPressed(int slot) {
        if (this.commands[slot] instanceof NoCommand) {
            System.out.println("Nao faz nada ....");
        } else {
            this.commands[slot].execute();
            this.undoCommands[slot] = this.commands[slot];
        }
    }

    public void buttonUndoWasPressed(int slot) {
        if (this.commands[slot] instanceof NoCommand) {
            System.out.println("Nao faz nada ....");
        } else {
            this.commands[slot].undo();
            this.undoCommands[slot] = new NoCommand();
        }

    }

}

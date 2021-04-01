/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author iapereira
 */
public class ControleUniversal {
    Command slots[] = new Command[3];

    public void setCommand(int i, Command command) {
        this.slots[i] = command;
    }
    
    public void pushButton(int i){
        this.slots[i].execute();
    }

    public void pushOffButton(int i) {
        this.slots[i].undo();
    }
    
    
}

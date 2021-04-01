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
public class SimpleRemoteControl {
    Command slot;
    
    public void setCommand(Command command){
        this.slot = command;
    }
    
    public void buttonWasPressed(){
        this.slot.execute();
    }
    
     public void buttonWasUnpressed(){
        this.slot.undo();
    }
}

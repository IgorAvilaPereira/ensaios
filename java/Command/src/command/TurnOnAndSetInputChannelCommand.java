/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import devices.Tv;

/**
 *
 * @author iapereira
 */
public class TurnOnAndSetInputChannelCommand implements Command {
    
    private Tv television;
    
    public TurnOnAndSetInputChannelCommand(Tv newTelevision){
        this.television = newTelevision;
    }

    @Override
    public void execute() {
        this.television.on();
        this.television.setInputChannel(9);
    }

    @Override
    public void undo() {
        this.television.off();
    }
    
}

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
public class TurnOffTvCommand implements Command {
    private Tv tv;
    
    public TurnOffTvCommand(Tv igor){
        this.tv = igor;
    }
       
    
    @Override
    public void execute() {
        this.tv.off();
        
    }

    @Override
    public void undo() {
        this.tv.on();
    }
    
}

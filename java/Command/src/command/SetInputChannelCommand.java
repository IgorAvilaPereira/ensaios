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
public class SetInputChannelCommand implements Command {
    private int channel = 1;
    private int oldChannel = 1;
    private Tv tv;
    
    
    public SetInputChannelCommand(Tv newTv, int newChannel){
        this.tv = newTv;
        this.oldChannel = this.channel;
        this.channel = newChannel;        
    }
    
    
    
    @Override
    public void execute() {
        this.tv.setInputChannel(this.channel);
    }

    @Override
    public void undo() {        
        this.tv.setInputChannel(this.oldChannel);
        this.channel =  this.oldChannel;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import devices.HomeTheater;
import command.Command;

/**
 *
 * @author iapereira
 */
public class TurnOnHtCommand implements Command {

    private final HomeTheater home;

    public TurnOnHtCommand(HomeTheater home) {
        this.home = home;
    }

    @Override
    public void execute() {
        this.home.on();
    }

    @Override
    public void undo() {
        this.home.off();
    }
    
}

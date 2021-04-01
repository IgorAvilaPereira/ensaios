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
public class Menu {

    private Command command;
    private Documento documento;

    public Menu() {

    }

    public void setCommand(Command command) {
        this.command = command;
    }

    public Command getCommand() {
        return this.command;
    }
    
    public void realizar(){
        this.command.execute();
    }

}

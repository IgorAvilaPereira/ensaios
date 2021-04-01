/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public class Controle {
    ArrayList<Command> vetCommand;
    
    
    public Controle(){
        this.vetCommand = new ArrayList();
        // dispositivo no slot 1
        this.vetCommand.add(new LuzOnOffCommand());
        // dispositivo no slot 2
        this.vetCommand.add(new GaragemAbrirFecharCommand(new Garagem()));
        // slot 3
        this.vetCommand.add(new MacroCarroCommand(new Carro()));

    }
    
    public void botaoON(int i){
        this.vetCommand.get(i).execute();
    }
    
    public void botaoOFF(int i){
        this.vetCommand.get(i).undo();
    }

    public ArrayList<Command> getVetCommand() {
        return vetCommand;
    }

    public void setVetCommand(ArrayList<Command> vetCommand) {
        this.vetCommand = vetCommand;
    }

    
    
    
}

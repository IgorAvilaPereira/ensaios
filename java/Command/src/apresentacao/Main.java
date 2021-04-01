/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import devices.HomeTheater;
import command.TurnOnHtCommand;
import command.SetInputChannelCommand;
import command.TurnOffTvCommand;
import command.TurnOnTvCommand;
import devices.Tv;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        SimpleRemoteControl control = new SimpleRemoteControl();
        
        Tv television = new Tv();        
        TurnOnTvCommand ligaTv = new TurnOnTvCommand(television);
        TurnOffTvCommand desligaTv = new TurnOffTvCommand(television);      
        SetInputChannelCommand trocaCanalTv = new SetInputChannelCommand(television, 9);

        
        
        HomeTheater home = new HomeTheater();
        TurnOnHtCommand onHome = new TurnOnHtCommand(home);
        
        control.addCommand(0, ligaTv);
        control.buttonWasPressed(0);
        control.addCommand(1, onHome);
        control.buttonWasPressed(1);
        
        System.out.println("Pressionando um slot vazio...");
        control.buttonWasPressed(2);
        
        //-----------------------
       // control.setCommand(desligaTv);
        //control.buttonUndoWasPressed();
    }
    
}

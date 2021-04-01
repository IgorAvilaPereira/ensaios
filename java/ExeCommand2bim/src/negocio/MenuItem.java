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
public class MenuItem {
    
    Command command;
   
    
    public void setComamnd(Command command){
        this.command = command;
    }
        
    public void click(){
        this.command.execute();
    }
    
}

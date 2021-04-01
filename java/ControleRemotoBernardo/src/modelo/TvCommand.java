/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author bernardo.silva
 */
public class TvCommand implements Command{
    TV tv;

    public TvCommand(TV tv) {
        this.tv = tv;
    }
    
    
    @Override
    public void execute() {
        this.tv.ligar();
        
    }

    @Override
    public void undo() {
        this.tv.desligar();
    }
    
    
    
}

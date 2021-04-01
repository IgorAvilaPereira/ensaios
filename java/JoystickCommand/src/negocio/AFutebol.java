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
public class AFutebol implements Command {
    private final Futebol futebol;
    
    public AFutebol(Futebol futebol){
        this.futebol = futebol;
    }
    
    @Override
    public void execute() {
        this.futebol.corrida();
    }
    
}

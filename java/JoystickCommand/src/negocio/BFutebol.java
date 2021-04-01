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
public class BFutebol implements Command{
    private final Futebol futebol;
    
    public BFutebol(Futebol futebol){
        this.futebol = futebol;
    }
    
    @Override
    public void execute() {
        this.futebol.passe();
    }
    
}

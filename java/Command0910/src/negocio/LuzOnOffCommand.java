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
public class LuzOnOffCommand implements Command {
    private Luz luz;
    
    public LuzOnOffCommand(){
        this.luz = new Luz();
    }
    

    @Override
    public void execute() {
        this.luz.liga();
    }

    @Override
    public void undo() {
        this.luz.desliga();
    }
    
}

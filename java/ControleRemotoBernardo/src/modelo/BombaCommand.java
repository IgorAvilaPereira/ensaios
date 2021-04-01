/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author iapereira
 */
public class BombaCommand implements Command{
    private Bomba bomba;

    public BombaCommand(Bomba bomba) {
        this.bomba = bomba;
    }
    
    
    @Override
    public void execute() {
        this.bomba.encherTanque();
    }

    @Override
    public void undo() {
        this.bomba.parar();
    }
    
    
}

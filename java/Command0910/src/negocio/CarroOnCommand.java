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
public class CarroOnCommand implements Command {

    private final Carro carro;

    public CarroOnCommand(Carro vibrador) {
        this.carro = vibrador;
    }

    @Override
    public void execute() {
        this.carro.ligar();
    }

    @Override
    public void undo() {
        this.carro.desligar();
    }
    
}

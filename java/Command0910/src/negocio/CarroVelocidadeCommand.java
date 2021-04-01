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
public class CarroVelocidadeCommand implements Command {

    private final Carro vibrador;

    public CarroVelocidadeCommand(Carro vibrador) {
        this.vibrador = vibrador;
    }

    @Override
    public void execute() {
        this.vibrador.ultraVelocidade();
    }

    @Override
    public void undo() {
        this.vibrador.velocidadeInicial();
        
    }
    
}

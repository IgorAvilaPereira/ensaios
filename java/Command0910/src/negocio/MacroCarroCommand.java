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
public class MacroCarroCommand implements Command {
    Command command[];
    private final Carro carro;
    
    public MacroCarroCommand(Carro carro){
        this.carro = carro;
        this.command = new Command[2];
        this.command[0] = new CarroOnCommand(carro);
        this.command[1] = new CarroVelocidadeCommand(carro);
    }

    @Override
    public void execute() {
        this.command[0].execute();
        this.command[1].execute();
    }

    @Override
    public void undo() {
        this.command[1].undo();
        this.command[0].undo();
    }

   
    
}

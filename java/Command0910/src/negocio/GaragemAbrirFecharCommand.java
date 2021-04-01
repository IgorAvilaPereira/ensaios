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
public class GaragemAbrirFecharCommand implements Command {
    Garagem garagem;
    
    public GaragemAbrirFecharCommand(Garagem garagem){
        this.garagem = garagem;
    }
    
    @Override
    public void execute() {
        this.garagem.abrir();
    }

    @Override
    public void undo() {
        this.garagem.fechar();
    }
    
}

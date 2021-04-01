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
public class PasteCommand implements Command {

    private Documento documento;
    
    public PasteCommand(Documento documento){
        this.documento = documento;
    }
    
    @Override
    public void execute() {
        System.out.println("Colando um texto..."+documento.getTexto());
    }
    
}

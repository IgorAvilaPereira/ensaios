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
public class CopyCommand implements Command {
    private Document document;
    
    public CopyCommand (Document document){
        this.document =  document;
    }    
    
    @Override
    public void execute() {
        //System.out.println("Copiando document...");
        document.copy();
    }
    
}

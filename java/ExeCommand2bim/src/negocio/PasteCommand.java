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

   private final Document document;
    
    public PasteCommand (Document document){
        this.document =  document;
    }    
    
    @Override
    public void execute() {
        this.document.paste();
    }
    
}

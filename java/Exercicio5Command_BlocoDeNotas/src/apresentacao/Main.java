/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.CopyCommand;
import negocio.Documento;
import negocio.Menu;
import negocio.PasteCommand;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Documento documento = new Documento("adjfoispfjasidufhasdoi");
        CopyCommand copyCommand = new CopyCommand(documento);
        PasteCommand pasteCommand = new PasteCommand(documento);
        Menu menu = new Menu();
        menu.setCommand(copyCommand);
        menu.realizar();
        
        
    }
    
}

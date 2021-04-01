/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.CopyCommand;
import negocio.Document;
import negocio.MenuItem;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Document document = new Document();
        CopyCommand copyCommand = new CopyCommand(document);
        MenuItem menuItem = new MenuItem();
        menuItem.setComamnd(copyCommand);
        menuItem.click();
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Document;
import negocio.ImageProxy;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Document d = new Document();
        d.getText().getWords().add("Igor");
        d.setImageProxy(new ImageProxy("gretchen.png"));
        d.show();
        d.getImageProxy().draw();
        d.show();
        
    }
    
}

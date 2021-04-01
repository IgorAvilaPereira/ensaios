/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleremotobernardo;

import modelo.Bomba;
import modelo.BombaCommand;
import modelo.ControleUniversal;
import modelo.TV;
import modelo.TvCommand;

/**
 *
 * @author iapereira
 */
public class ControleRemotoBernardo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ControleUniversal controleUniversal = new ControleUniversal();
        controleUniversal.setCommand(0, new TvCommand(new TV(32, "Samsung")));
        controleUniversal.pushButton(0);
        controleUniversal.pushOffButton(0);
        controleUniversal.setCommand(1, new BombaCommand(new Bomba()));
        controleUniversal.pushButton(1);
        controleUniversal.pushOffButton(1);
        
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.CoffeMenu;
import negocio.DinerMenu;
import negocio.PancakeHouseMenu;
import negocio.Waitress;

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
        Waitress w = new Waitress(new PancakeHouseMenu(), new DinerMenu(), new CoffeMenu());
        w.printMenu();
    }
    
}

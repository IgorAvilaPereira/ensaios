/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Oi;

/**
 *
 * @author iapereira
 */
public class TestProva {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Oi oi =  new Oi();
        
        System.out.println(oi.x(2));
        System.out.println(oi.w(-1)) ;
        
        for (int i = -1; i < 10; i++) {
            System.out.println(i+":"+oi.y(i));
        }
    }    
}

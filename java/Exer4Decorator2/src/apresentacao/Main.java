/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Coquetel;
import negocio.Refrigerante;
import negocio.Rum;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Coquetel rumComRefri = new Rum();
        rumComRefri = new Refrigerante(rumComRefri);
        System.out.println("Bebida:"+rumComRefri.getNome());
        System.out.println("Preço:"+rumComRefri.getPreco());
    }
    
}

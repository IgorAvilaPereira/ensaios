/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Coquetel;
import negocio.Refri;
import negocio.Vodka;

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
        Coquetel c = new Vodka();
        c = new Refri(c);
        System.out.println("Descrição:"+c.getNome());
        System.out.println("Preço:"+c.getPreco());
        
    }
    
}

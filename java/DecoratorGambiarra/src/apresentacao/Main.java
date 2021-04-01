/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Bebida;
import negocio.Limao;
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
        Bebida vodka = new Vodka();
        vodka.addIngrediente(new Limao());
        System.out.println("Descricao:"+vodka.getDescricao());
        System.out.println("Custo:"+vodka.custo());
    }
    
}

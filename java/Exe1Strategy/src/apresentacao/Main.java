/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Brinquedo;
import negocio.Dvd;
import negocio.JaneiroDesconto;
import negocio.Liquidacao;
import negocio.Regular;

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
        /*
        Brinquedo lego = new Brinquedo();
        lego.setNome("Lego");
        lego.setPreco(1000);
        lego.setPromocao(new Liquidacao());               
        System.out.println("Lego Preco:"+lego.calcPreco());
        */
        Dvd robertoDVD = new Dvd("Roberto Carlos", 5, new Regular(new JaneiroDesconto()));
        System.out.println("Preço:"+robertoDVD.calcPreco());
       
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Boleto;
import negocio.Brinquedo;
import negocio.Carrinho;
import negocio.Debito;
import negocio.Dvd;
import negocio.Item;
/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
      
        Dvd robertoDVD = new Dvd("Roberto Carlos", 5);
        Brinquedo lego = new Brinquedo();
        lego.setNome("Lego");
        lego.setPreco(10);
        
        Carrinho carrinho = new Carrinho();
        carrinho.getVetItem().add(new Item(robertoDVD, 2));
        carrinho.getVetItem().add(new Item(lego, 1));
        //carrinho.setFormaDePagamento(new Debito());
        carrinho.setFormaDePagamento(new Boleto());
        carrinho.gerarNota();      
       
    }
    
}

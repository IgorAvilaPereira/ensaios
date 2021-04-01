/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Credito;
import negocio.Debito;
import negocio.Liquidacao;
import negocio.Livro;
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
        Livro l = new Livro();
        l.setNome("Biblia");
        l.setNomeAutor("Apostolos");
        l.setPreco(10.0);
        l.setPromocao(new Liquidacao());
        System.out.println("Preço (sem desconto:)"+l.getPreco());
        System.out.println("Preço (com desconto):"+l.calcPreco());
        l.setPromocao(new Regular());
        System.out.println("Preço (com desconto) regular:"+l.calcPreco());
        l.setPag(new Credito());
        l.calcPreco();
    }
    
}

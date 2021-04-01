/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author iapereira
 */
public class Boleto implements FormaDePagamento {

    @Override
    public void pagar(Carrinho carrinho) {
        System.out.println("Através de boleto...");
        System.out.println("Você irá pagar :"+carrinho.valorTotal() + " por boleto...");
        
    }
    
}

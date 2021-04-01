/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Loja;
import negocio.PagamentoCredito;
import negocio.PagamentoDebito;

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
        Loja loja =  new Loja("loja");
        loja.executarCompra(100, new PagamentoDebito());
        
       loja.executarCompra(100, new PagamentoCredito());

    }
    
}

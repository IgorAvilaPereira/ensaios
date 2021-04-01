/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import negocio.Compra;
import negocio.PagamentoCommand;

/**
 *
 * @author iapereira
 */
public class PagamentoCartaoDebito implements PagamentoCommand {

 
    @Override
    public void processarCompra(Compra compra) {
        System.out.println("Pagamento realizado por cartão de débito..!\n" + compra.getInfoNota());
    }
 
    
}

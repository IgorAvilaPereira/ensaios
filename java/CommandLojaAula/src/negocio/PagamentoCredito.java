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
public class PagamentoCredito implements PagamentoCommand {

    @Override
    public void processarCompra(Compra compra) {
        System.out.println("Pagamento Credito:"+compra.getInfoNota());
    }
    
}

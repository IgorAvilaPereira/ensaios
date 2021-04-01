/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

public class PagamentoBoleto implements PagamentoCommand {
 
    @Override
    public void processarCompra(Compra compra) {
        System.out.println("Boleto criado!\n" + compra.getInfoNota());
    }
 
}

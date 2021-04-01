/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

public class Loja {

    protected String nomeDaLoja;

    public Loja(String nome) {
        nomeDaLoja = nome;
    }

    public void executarCompra(double valor, PagamentoCommand formaDePagamento) {
        Compra compra = new Compra(nomeDaLoja);
        compra.setValor(valor);
        formaDePagamento.processarCompra(compra);
    }
}

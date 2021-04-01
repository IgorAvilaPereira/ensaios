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
public class RelatorioCliente extends Relatorio {

    @Override
    protected void exibirConteudo() {
        System.out.println("Israel");
        System.out.println("JP");
        System.out.println("Fê");
        System.out.println("Yuri IORC");
    }
    
    public void exibirRodape(){
        System.out.println("Rodape customizado...");
    }
}

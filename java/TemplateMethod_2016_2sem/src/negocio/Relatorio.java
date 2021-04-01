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
public abstract class Relatorio {
    
    public final void exibir(){
        exibirCabecalho();
        System.out.println("=============");
        exibirConteudo();
        System.out.println("===============");
        exibirRodape();
    }

    protected void exibirCabecalho() {
        System.out.println("Sauna 29 - Relatorio");
    }

    public abstract void exibirConteudo();

    private void exibirRodape() {
        System.out.println("Contato com a tia carmen....");
    }
    
    
    
    
}

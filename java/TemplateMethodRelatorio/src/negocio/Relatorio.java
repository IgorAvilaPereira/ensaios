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
        exibirConteudo();
        exibirRodape();
    }
    
    private void exibirCabecalho(){
        System.out.println("Cabecalho...");
    }
    
    protected void exibirRodape(){
        System.out.println("Sauna 29....");
    }
    
    protected abstract void exibirConteudo();
    
}

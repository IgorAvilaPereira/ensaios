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
public class Relatorio {
    protected ComportamentoConteudo conteudo;
    
    public Relatorio(ComportamentoConteudo conteudo){
        this.conteudo = conteudo;
    }
    
    public void exibirRelatorio(){
        exibirCabecalho();
        conteudo.exibirConteudo();
        exibirRodape();
    }

    private void exibirCabecalho() {
        System.out.println("Cabealho");
    
    }

    private void exibirRodape() {
        System.out.println("Rodape");
    }
    
    
}

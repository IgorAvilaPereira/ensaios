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
    
   public final void gerar(){
       // o da propria classe = classe pai
       exibirCabecalho();
       
       // vai chamar das classes filhos...
       exibirConteudo();
       
       // o da propria classe = classe pai
       exibirRodape();
   }

    private void exibirCabecalho() {
        System.out.println("Sauna 29 - Relatorios");
        System.out.println("========================");
    }

    protected abstract void exibirConteudo();

    private void exibirRodape() {
        System.out.println("========================");
        System.out.println("Rua Alfredo Huch ....perto do ifrs. Pessoal da mecanica..");
    }
    
}

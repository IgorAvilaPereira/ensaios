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
public class RelatorioC extends Relatorio{

    public void exibirCabecalho(){
        System.out.println("Relatorio de Cliente - Sauna 29/69/120");
    }    
        
    @Override
    public void exibirConteudo() {
        System.out.println("Zamber");
        System.out.println("GUiDasNovinhasDONorte");
        System.out.println("IBroca...");
    }
    
}

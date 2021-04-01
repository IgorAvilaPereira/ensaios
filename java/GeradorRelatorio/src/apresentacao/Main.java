/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.RelatorioClienteCSV;
import negocio.RelatorioClienteXML;
import negocio.Relatorio;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        Relatorio rs = new RelatorioClienteCSV();
        // chama o exibir conteudo da classe relatorio cliente...
        rs.gerar();
        
        
        Relatorio rsG = new RelatorioClienteXML();
        rsG.gerar();
    }
    
}

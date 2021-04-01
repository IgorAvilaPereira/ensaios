/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Relatorio;
import negocio.RelatorioC;
import negocio.RelatorioP;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Relatorio relatorioPu = new RelatorioP();
        relatorioPu.exibir();
        System.out.println("====================");
        System.out.println("RelC");
        Relatorio relatorioCl = new RelatorioC();
        relatorioCl.exibir();
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import modelo.Relatorio;
import modelo.RelatorioAlunosAPS;

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
        Relatorio relatorio = new RelatorioAlunosAPS();
        System.out.println(relatorio.gerar());
    }
    
}

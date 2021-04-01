/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Relatorio;
import negocio.RelatorioCliente;
import negocio.RelatorioMeninas;

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
        
        Relatorio relMeninas = new RelatorioMeninas();
       relMeninas.exibir();
        System.out.println("----------");
       Relatorio relClientes = new RelatorioCliente();
       relClientes.exibir();
    }
    
}

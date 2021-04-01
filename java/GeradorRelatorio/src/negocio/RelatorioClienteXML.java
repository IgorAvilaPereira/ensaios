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
public class RelatorioClienteXML extends Relatorio {

    @Override
    public void exibirConteudo() {
        System.out.println("<clientes> <cliente> Tham</cliente>");
        System.out.println("<cliente> Gerson </cliente>");
        System.out.println("<cliente> Miranda </cliente>");
        System.out.println("<cliente> Kleberson </cliente>");
        System.out.println("<cliente>  Joao </cliente> </clientes>");
        
        
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import java.util.List;
import modelo.Cliente;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        /*
        Cliente cliente = new Cliente();
        cliente.setId(2);
        System.out.println("Nome:"+cliente.getNome());
        cliente.carregar();
        System.out.println("Nome:"+cliente.getNome());

        List<Cliente> vetCliente = Cliente.listarTodos();
        for (int i = 0; i < vetCliente.size(); i++) {
            Cliente aux = vetCliente.get(i);
            System.out.println("Nome:"+aux.getNome());
            
        }*/
        
        Cliente novoCliente = new Cliente();
        novoCliente.setNome("Pierre");
        System.out.println("Id antes de salvar:"+novoCliente.getId());
        novoCliente.salvar();
        System.out.println("Id depois de salvar:"+novoCliente.getId());
    }
    
}

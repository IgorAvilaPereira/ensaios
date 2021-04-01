/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import java.util.List;
import modelo.Cliente;
import repository.RepositoryCliente;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        RepositoryCliente repositoryCliente = new RepositoryCliente();
        List<Cliente> vetCliente = repositoryCliente.selecionarEntre10e12();
        for (int i = 0; i < vetCliente.size(); i++) {
            Cliente cliente = vetCliente.get(i);
            System.out.println("Cliente:"+cliente.getId() + ":"+ cliente.getNome());
            
        }
    }
    
}

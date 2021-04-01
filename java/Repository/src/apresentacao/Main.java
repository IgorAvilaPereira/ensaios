/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import java.util.List;
import modelo.Cliente;
import repositorio.RepositorioCliente;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        // TODO code application logic here
        RepositorioCliente repositorio = new RepositorioCliente();
        //Cliente novoCliente =  new Cliente();
        //novoCliente.setNome("Igor Repositorio");
        //repositorio.create(novoCliente);
        List<Cliente> vetCliente = repositorio.selectAllBeginI();
        for (int i = 0; i < vetCliente.size(); i++) {
            Cliente cliente = vetCliente.get(i);
            System.out.println(cliente.getNome());
            
        }
        repositorio.removeAllBeginI();
        
    }
    
}

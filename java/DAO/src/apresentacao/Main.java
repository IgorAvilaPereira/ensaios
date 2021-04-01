/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import java.util.List;
import modelo.Cliente;
import persistencia.ClienteDAO;
import persistencia.Conexao;

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
        //new Conexao().getConexao();
       ClienteDAO dao = new ClienteDAO();
        Cliente cliente =  dao.obter(2);
        System.out.println("Nome:"+cliente.getNome());
        System.out.println("Tamanho do vetor endereco antes de chamar o listarEndereco:"+cliente.getVetEndereco().size());
        dao.obterEnderecos(cliente);
        System.out.println("Tamanho do vetor endereco depois  de chamar o listarEndereco:"+cliente.getVetEndereco().get(0).getDescricao());
        /*
        Cliente cliente =  new Cliente();
        cliente.setNome("Everton(Ubuntu)");
        ClienteDAO dao = new ClienteDAO();
        dao.salvar(cliente);
        
       List<Cliente> vetCLiente = dao.listarTodos();
        for (int i = 0; i < vetCLiente.size(); i++) {
            Cliente aux = vetCLiente.get(i);
            System.out.println("Nome:"+aux.getNome());
        }*/
    }
    
}

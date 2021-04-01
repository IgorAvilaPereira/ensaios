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
       
      Cliente pierre = new Cliente();
      pierre.setId(6);
      pierre.carregar();
      System.out.println("Id:"+pierre.getId());
      System.out.println("Nome:"+pierre.getNome());
      // novoCliente.setNome("Ricardo");
      pierre.excluir();
      //System.out.println("Id depois excluir:"+ricardo.getId());
      System.out.println("Id:"+pierre.getId());
      System.out.println("Nome:"+pierre.getNome());
      pierre.salvar();

    }
    
}

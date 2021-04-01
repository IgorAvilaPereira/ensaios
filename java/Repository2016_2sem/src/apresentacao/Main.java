/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import java.util.List;
import negocio.Pessoa;
import negocio.repository.PessoaRepository;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        PessoaRepository repositorio = new PessoaRepository();
        List<Pessoa> vetPessoa = repositorio.listId(1);
        for (int i = 0; i < vetPessoa.size(); i++) {
            Pessoa pessoa = vetPessoa.get(i);
            System.out.println("Nome:"+pessoa.getNome());
            
        }
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import negocio.Pessoa;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        Pessoa pessoa = new Pessoa();
        pessoa.setId(1);
        pessoa.load();
        System.out.println("Nome:"+pessoa.getNome());
        System.out.println("Ainda sem instanciar o objeto de endereco");
        System.out.println("Tenho endereco:"+(pessoa.getEndereco2() !=  null));
        System.out.println("==================================");
        System.out.println("Chamando o endereco");
        System.out.println("Logradouro:"+pessoa.getEndereco().getLogradouro());
       System.out.println("Tenho endereco:"+(pessoa.getEndereco2() !=  null));

        
    }
    
}

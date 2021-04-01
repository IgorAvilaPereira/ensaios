/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;
import negocio.*;
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
        PessoaFisica pessoaFisica =  new PessoaFisica();
        System.out.println(pessoaFisica);
        pessoaFisica.setId(5);
        System.out.println(pessoaFisica);
        pessoaFisica.carregar();
        System.out.println(pessoaFisica);
        pessoaFisica.setNome("Yuri safadao...");
        pessoaFisica.alterar();
        pessoaFisica.carregar();
        System.out.println(pessoaFisica);
        ArrayList<PessoaFisica> v =PessoaFisica.selecionarcomecandoy();
        for (int i = 0; i < v.size(); i++) {
            PessoaFisica p = v.get(i);
            System.out.println(p);
            
        }
        
        /*
        PessoaFisica objIgor = new PessoaFisica();        
        PessoaFisicaDAO pessoaFisicaDAO = new PessoaFisicaDAO();
        Scanner entrada = new Scanner(System.in);
        objIgor.setNome(entrada.nextLine());
        objIgor.setCpf(entrada.nextLine());
        pessoaFisicaDAO.inserir(objIgor);
        */
      
        /*
        PessoaFisica pessoaFisica =  new PessoaFisica();
        pessoaFisica.setId(2);
        pessoaFisica.setNome("Thammy Gretchen");
        pessoaFisica.setCpf("12345678912");
        System.out.println("Alterou?:"+pessoaFisica.alterar());
        //System.out.println("Excluiu?:"+pessoaFisicaDAO.excluir(1));
        ArrayList<PessoaFisica> vet = PessoaFisica.selecionarTodos();
        for (int i = 0; i < vet.size(); i++) {
            PessoaFisica p = vet.get(i);
            System.out.println(p);
            
        }*/
    }
    
}

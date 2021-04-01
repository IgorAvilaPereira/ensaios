/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.ArrayList;
import java.util.List;
import negocio.Pessoa;
import negocio.repositorio.PessoaRepositorio;
import persistencia.PessoaDAO;

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
        //Pessoa pessoa =  new Pessoa();
        //pessoa.setNome("GuilhermeNamoradoDaFilhaDaAline");
        //pessoa.setSobrenome("Sauna 29.1");
        PessoaRepositorio repositorio = new PessoaRepositorio();
        List<Pessoa> vet = new ArrayList();
        vet = repositorio.findSauna29();
        System.out.println("Tamanho:"+vet.size());
        for (int i = 0; i < vet.size(); i++) {
            Pessoa pessoa = vet.get(i);
            System.out.println("Nome/Sobrenome:"+pessoa.getNome()+"/"+pessoa.getSobrenome());
            
        }

        //repositorio.inserir(pessoa);
        //PessoaDAO pessoaDAO = new PessoaDAO();
        //pessoaDAO.inserir(pessoa);
    }
    
}

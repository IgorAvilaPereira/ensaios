/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.repositorio;

import java.util.ArrayList;
import java.util.List;
import negocio.Pessoa;
import persistencia.PessoaDAO;

/**
 *
 * @author iapereira
 */
public class PessoaRepositorio extends Repositorio {    

    public PessoaRepositorio() {
        super();
    }
    
     public List<Pessoa> findSauna29(){
         Criterio criterio = new Criterio();         
         criterio.setCampo(Pessoa.SOBRENOME);
         criterio.setOperador("=");
         criterio.setValor("'Sauna 29'");
         List<Criterio> vetCriterio = new ArrayList();
         vetCriterio.add(criterio);
         String consulta = super.satisfazendo(Pessoa.class.getSimpleName(), vetCriterio);
         PessoaDAO pessoaDAO = new PessoaDAO();
         List<Pessoa> vetPessoa = pessoaDAO.executePesquisa(consulta);
         return vetPessoa;
         

         
     }

    
    
    
    public void inserir(Pessoa pessoa){
        PessoaDAO pessoaDAO = new PessoaDAO();
        pessoaDAO.inserir(pessoa);
    }
    
    
}

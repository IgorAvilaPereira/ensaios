/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.repository;

import persistencia.PessoaDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import negocio.Pessoa;

/**
 *
 * @author iapereira
 */
public class PessoaRepository {
    private final PessoaDAO pessoaDAO;
    
    public PessoaRepository(){
        this.pessoaDAO =  new PessoaDAO();
    }
    
    public List<Pessoa> listId(int id) throws SQLException{
        List<QueryCriteria> vetCriteria = new ArrayList();        
        QueryCriteria criteria =  new QueryCriteria();
        criteria.setOperador(Operator.EQ);
        criteria.setCampo(Pessoa.ID);
        criteria.setValor(id);
        vetCriteria.add(criteria);
        return this.result(vetCriteria);
    }
    
    public void delete(int id) throws SQLException{
        List<QueryCriteria> vetCriterio = new ArrayList();        
        QueryCriteria criterio =  new QueryCriteria();
        criterio.setOperador("=");
        criterio.setCampo(Pessoa.ID);
        criterio.setValor(id);
        vetCriterio.add(criterio);
        this.satisfazendoDelete(vetCriterio);        
    }

    private List<Pessoa> result(List<QueryCriteria> vetCriteria) throws SQLException {
        String consulta  = pessoaDAO.getSelect();
        consulta +=" WHERE TRUE and ";
        for (int i = 0; i < vetCriteria.size(); i++) {
            QueryCriteria criterio = vetCriteria.get(i);
            consulta  += criterio.getCampo() + " " + criterio.getOperador() + " " + criterio.getValor();            
        }
        return this.pessoaDAO.executeQuery(consulta);
    }

    private void satisfazendoDelete(List<QueryCriteria> vetCriterio) throws SQLException {
        String consulta  = pessoaDAO.getDelete();
        consulta +=" WHERE TRUE and ";
        for (int i = 0; i < vetCriterio.size(); i++) {
            QueryCriteria criterio = vetCriterio.get(i);
            consulta  += criterio.getCampo() + " " + criterio.getOperador() + " " + criterio.getValor();            
        }
        this.pessoaDAO.executeUpdate(consulta);
    }

    
    
}

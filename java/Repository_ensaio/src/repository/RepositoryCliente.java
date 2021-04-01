/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import modelo.Cliente;
import persistencia.ClienteDAO;

/**
 *
 * @author iapereira
 */
public class RepositoryCliente {   
   private IRepositoryStrategy strategy;   
   private ClienteDAO dao;
   
   public RepositoryCliente(){
       this.strategy = new SqlRepositoryStrategy();
       this.dao =  new ClienteDAO();
   }
    
   public void create(Cliente cliente) throws SQLException{
       dao.salvar(cliente);
   } 
 
   public void update(Cliente cliente){
       dao.atualizar(cliente);
       
   }
   
   public void delete(Cliente cliente) throws SQLException{
       dao.excluir(cliente.getId());
       
   }
   
   public List<Cliente> selecionarMaioresQueID1() throws SQLException{
       Query q = new Query();
       q.addCriteria(new Criteria(">", Cliente.ID, 1));
       String where = strategy.matching(q);
       return dao.execute(where);
   }
   
    public List<Cliente> selecionarEntre10e12() throws SQLException{
       Query q = new Query();
       q.addCriteria(new Criteria(Operador.MAIOR, Cliente.ID, 10));
       q.addCriteria(new Criteria(Operador.E));       
       q.addCriteria(new Criteria(Operador.MENOROUIGUAL, Cliente.ID, 12));
       String where = strategy.matching(q);
       return dao.execute(where);
   }
  
}

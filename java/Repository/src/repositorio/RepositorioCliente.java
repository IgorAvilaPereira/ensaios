/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repositorio;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Cliente;
import persistencia.ClienteDAO;

/**
 *
 * @author iapereira
 */
public class RepositorioCliente implements IRepository<Cliente> {     
    private IRepositorioStrategy strategy;
    private ClienteDAO dao;
    
    public RepositorioCliente(){
        this.strategy = new SQLRepositoryStrategy();
        this.dao = new ClienteDAO();
    }  
  
    
    public void removeAllBeginI() throws SQLException{
        Query q = new Query();       
        q.addCriteria(new Criteria(Operador.ILIKE, Cliente.NOME, "'I%'"));
        String sql = this.strategy.matching(q);
        dao.executeOO(sql);  
    }
    
    public List<Cliente> selectAll(){
        return new ArrayList();
    }
    
    public List<Cliente> selectAllBeginI() throws SQLException{
        Query q = new Query();       
        q.addCriteria(new Criteria(Operador.ILIKE, Cliente.NOME, "'I%'"));
        String sql = this.strategy.matching(q);
        return dao.executeQueryOO(sql);           
        
    }

    @Override
    public void create(Cliente modelo) throws SQLException{
        this.dao.insert(modelo);
        
    }
    
    public void update(Cliente modelo){
        this.dao.update(modelo);
        
    }
    
    public void remove(Cliente modelo){
        this.dao.remove(modelo.getId());
        
    }
    
}

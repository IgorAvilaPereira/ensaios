/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repositorio;
 
import java.util.List;
import repositorio.Query;



/**
 *
 * @author iapereira
 */
public class SQLRepositoryStrategy implements IRepositorioStrategy {

   

    @Override
    public String matching(Query query) {
        List<Criteria> vetCriteria = query.getVetCriteria();
        String sql = " WHERE ";
        for (int i = 0; i < vetCriteria.size(); i++) {
            Criteria criteria = vetCriteria.get(i);
            sql+= " "+criteria.getField() + " " + criteria.getOperator() + " " + criteria.getValue().toString();     
        }
        return sql;
    }

   

    
    
}

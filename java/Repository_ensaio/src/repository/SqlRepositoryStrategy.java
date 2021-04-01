/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.util.List;

/**
 *
 * @author iapereira
 */
public class SqlRepositoryStrategy implements IRepositoryStrategy{

    @Override
    public String matching(Query query) {
        List<Criteria> vetCriteria = query.getCriterias();
        String where = "WHERE";
        for (int i = 0; i < vetCriteria.size(); i++) {
            Criteria criteria = vetCriteria.get(i);
            if (criteria.getField() != null && criteria.getOperador() != null && criteria.getValue() != null){
                where+= " "+criteria.getField() + " " + criteria.getOperador() + " " + criteria.getValue().toString();
            } else {
               where+= " "+criteria.getOperador();
            }            
        }
        return where;
        
    }
    
}

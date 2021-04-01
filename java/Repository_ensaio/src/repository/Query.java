/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author iapereira
 */
public class Query {
    private List<Criteria> criterias;
    
    public Query(){
        this.criterias = new ArrayList();
    }
    
    //public void execute(UnitOfWork uow){
        
    //}

    public List<Criteria> getCriterias() {
        return criterias;
    }
    
    public void removeCriteria(int i){
        this.criterias.remove(i);
    }
    
    public void addCriteria(Criteria criteria){
        this.criterias.add(criteria);
    }

    public void setCriterias(List<Criteria> criterias) {
        this.criterias = criterias;
    }
    
    
    
    
}

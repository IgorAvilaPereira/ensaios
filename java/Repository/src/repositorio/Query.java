/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repositorio;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author iapereira
 */
public class Query {
    private List<Criteria> vetCriteria;

    public Query() {
        this.vetCriteria = new ArrayList();
    }

    
    
    public List<Criteria> getVetCriteria() {
        return vetCriteria;
    }

    public void setVetCriteria(List<Criteria> vetCriteria) {
        this.vetCriteria = vetCriteria;
    }

    public void addCriteria(Criteria criteria) {
        this.vetCriteria.add(criteria);
    }
    
    
    
    
}

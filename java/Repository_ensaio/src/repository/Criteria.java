/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

/**
 *
 * @author iapereira
 */
public class Criteria {
    private String operador;
    private String field;
    private Object value;

    public Criteria(String operador) {
        this.operador = operador;
        this.field = null;
        this.value = null;
    }    
    

    public Criteria(String operador, String field, Object value) {
        this.operador = operador;
        this.field = field;
        this.value = value;
    }

    public String getOperador() {
        return operador;
    }

    public String getField() {
        return field;
    }

    public Object getValue() {
        return value;
    }
    
    
    
    
    
    
    
}

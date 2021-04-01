/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repositorio;

/**
 *
 * @author iapereira
 */
public class Criteria {
    private String operator;
    private String field;
    private Object value;

    public Criteria(String operator, String field, Object value) {
        this.operator = operator;
        this.field = field;
        this.value = value;
    }
    
    

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }
    
    
    
    
}

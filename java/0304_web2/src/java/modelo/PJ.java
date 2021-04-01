/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;


import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class PJ extends P{
    @Column
    private String cnpj;

    public PJ() {
    }
    
   
    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }
    
    
}

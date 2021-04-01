/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 *
 * @author iapereira
 */

@Entity
public class PessoaJuridica extends Pessoa {
    
    @Column
    private String cnpj;

    public PessoaJuridica() {
    }
    
    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;

/**
 *
 * @author iapereira
 */
@Entity
public class PessoaFisica extends Pessoa implements Serializable{
    @Column(name = "cpf")
    private String cpf;

    public PessoaFisica() {
        super();
    }

    public PessoaFisica(String nome, String cpf) {        
        this.nome = nome;
        this.cpf =  cpf;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    
    
    
}

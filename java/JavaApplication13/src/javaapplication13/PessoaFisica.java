/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication13;

/**
 *
 * @author iapereira
 */
public class PessoaFisica extends Pessoa {
    private String cpf;
    
    public PessoaFisica(int id, String nome, String cpf){
        super(id, nome);
        this.cpf = cpf;
    }
    /*
    @Override
    public String toString() {
        return "PessoaFisica{"+"id=" + super.getId() + ", nome= " + super.getNome() + " cpf=" + cpf + "}";
    }*/
    
    
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author iapereira
 */
public class PessoaFisica extends Pessoa {
    private String cpf;
    
    
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    
    

    @Override
    public void executarProtecao() {
        System.out.println("Pessoa Fisica disparando seu método de proteção...");
        System.out.println(this.nome);
        protecao.proteger();
        
    }
    
    @Override
    public String toString(){
        return this.id+";"+this.cpf+";"+this.nome;
    }
    
}

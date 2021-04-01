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
public class PessoaJuridica extends Pessoa {
    private String cnpj;

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }
    
    

    @Override
    public void executarProtecao() {
        System.out.println("Pessoa Juridica protegendo-se");
        System.out.println(this.nome);
        protecao.proteger();
    }
    
    
}

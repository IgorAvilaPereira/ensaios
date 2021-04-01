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
public class JavaApplication13 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        //Pessoa pessoa = new Pessoa(2,"ops" );
        
        PessoaFisica pessoaFisica = new PessoaFisica(1, "Igor","0177777");
        System.out.println("PessoaFisica:"+pessoaFisica.toString());
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

/**
 *
 * @author iapereira
 */
public class Ciumento implements Convidado {
    private String nome;

    public Ciumento(String nome) {
        this.nome = nome;
    }

    @Override
    public void notificacao(String mensagem) {
        System.out.println("=============================");
        System.out.println("Ciumento:"+this.nome + ":ficou sabendo de ...");
        System.out.println(mensagem);
        System.out.println("=============================");
    }

    @Override
    public String getNome() {
        return this.nome;
    }
    
    
    
    
}

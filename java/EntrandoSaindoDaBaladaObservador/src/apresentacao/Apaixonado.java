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
public class Apaixonado implements Convidado {

    private String nome;

    public Apaixonado(String nome) {
        this.nome = nome;
    }

    @Override
    public void notificacao(String mensagem) {
        if (mensagem.contains("Robinson")) {
                        System.out.println("Meu amor chegou...");

         
        } else {
               System.out.println("=============================");
            System.out.println("Apaixonado:" + this.nome + ": ficou sabendo de ...");
            System.out.println(mensagem);
            System.out.println("=============================");
        }
    }

    @Override
    public String getNome() {
        return this.nome;
    }

}

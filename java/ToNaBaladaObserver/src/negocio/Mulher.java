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
public class Mulher implements Observer {
    private String nome;

    public Mulher(String nome) {
        this.nome = nome;
    }
    
    @Override
    public void update(String nomeNovoConvidado) {
        System.out.println(this.nome+": Acabou de entrar na festa "+nomeNovoConvidado);
    }

    @Override
    public String getNome() {
        return this.nome;
    }
    
}

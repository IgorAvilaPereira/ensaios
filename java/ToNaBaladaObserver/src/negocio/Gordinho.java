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
public class Gordinho implements Observer {
    private String nome;

    public Gordinho(String nome) {
        this.nome = nome;
    }
    
    @Override
    public void update(String nomeNovoConvidado) {
        System.out.println(this.nome+":(Gordinho): ficou sabendo que chegou na festa :"+nomeNovoConvidado);
    }

    @Override
    public String getNome() {
        return this.nome;
    }
    
}

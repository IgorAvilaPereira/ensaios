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
public class Magrinho implements Observer {
    private String nome;

    public Magrinho(String nome) {
        this.nome = nome;
    }
    
    
   @Override
    public void update(String nomeNovoConvidado) {
        System.out.println(this.nome+"(O magrinho): "+ " ficou sabendo da nova pessoa na festa:"+nomeNovoConvidado);
    }

    @Override
    public String getNome() {
        return this.nome;
    }
    
}

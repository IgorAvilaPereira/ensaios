/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public class Cliente {
    private int id;
    private String nome;
    private ArrayList<Endereco> vetEndereco;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public ArrayList<Endereco> getVetEndereco() {
        return vetEndereco;
    }

    public void setVetEndereco(ArrayList<Endereco> vetEndereco) {
        this.vetEndereco = vetEndereco;
    }
    
    
    
    
    
}

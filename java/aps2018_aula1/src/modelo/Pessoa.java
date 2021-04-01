/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author iapereira
 */
public abstract class Pessoa {
    private int id;
    private String nome;
    private int idade;
    private char sexo;
    
     public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public String getNome() {
        return nome;
    }
    
    
    public abstract String imprime();
    
}

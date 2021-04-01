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
public class Usuario {
    private int id;
    private String email;
    private String nome;
    private char preferencia; 
    
    public Usuario(){
        this.id = 0;
        this.email = null;
        this.nome = null;
        this.preferencia = '0';                
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public char getPreferencia() {
        return preferencia;
    }

    public void setPreferencia(char preferencia) {
        this.preferencia = preferencia;
    }
    
    
    
    
    
    
}

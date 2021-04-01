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
public class Anotacao {
    private int id;
    private String titulo;
    private String descricao;
    private boolean lixeira;

    public Anotacao() {
    }
    
    

    public Anotacao(String titulo, String descricao) {
        this.titulo = titulo;
        this.descricao = descricao;
    }

    public boolean isLixeira() {
        return lixeira;
    }

    public void setLixeira(boolean lixeira) {
        this.lixeira = lixeira;
    }
    
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    
    
}

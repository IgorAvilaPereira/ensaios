/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ClienteDAO;

/**
 *
 * @author iapereira
 */
public class Cliente {
    private int id;
    private String nome;
    private List<Endereco> vetEndereco;
    // novidade
    private ClienteDAO dao;
    
    public Cliente(){
        // novidade
        this.dao = new ClienteDAO();
        //jah tinha
        this.vetEndereco = new ArrayList();
    }

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

    public List<Endereco> getVetEndereco() {
        return vetEndereco;
    }

    public void setVetEndereco(List<Endereco> vetEndereco) {
        this.vetEndereco = vetEndereco;
    }
    
   
     public void salvar() throws SQLException{
        this.dao.salvar(this);
    }
     public void excluir() throws SQLException{
        this.dao.excluir(this.id);
        this.id = 0;
    }

    public void carregar() throws SQLException {
        this.dao.obter(this);
    }
    
    
    
}

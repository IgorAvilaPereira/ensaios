/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.sql.SQLException;
import java.util.ArrayList;
import persistencia.TimeDAO;

/**
 *
 * @author iapereira
 */
public class Time {
    private int id;
    private String nome;
    private String endereco;
    private final TimeDAO timeDAO;

    public Time() {
        this.timeDAO = new TimeDAO();
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

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    @Override
    public String toString() {
        return "Time{" + "nome=" + nome + ", endereco=" + endereco + '}';
    }
    
    
    public boolean adicionar() throws SQLException{        
        return this.timeDAO.adicionar(this);
        
    }
    
    public void alterar() throws SQLException{
        this.timeDAO.alterar(this);
    }
    
    
    public static ArrayList<Time> listar() throws SQLException{
        return new TimeDAO().listar();
    }

    public void excluir() throws SQLException {
        this.timeDAO.excluir(this.id);
    }
    
    
    
    
    
    
    
    
}

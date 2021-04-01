/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import persistencia.ConexaoPostgreSQL;

/**
 *
 * @author iapereira
 */
public class Garcom {
    private int id;
    private String nome;
    private String apelido;
    
    public Garcom (){
        
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

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }
    
    public void salvar() throws SQLException {
        String sql = "INSERT INTO garcom (nome, apelido) VALUES (?, ?);";
        // aqui entra o singleton
        ConexaoPostgreSQL conexaoPostgreSQL = ConexaoPostgreSQL.getInstance();
        // sem singleton
        //ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        System.out.println("Hashcode:"+conexaoPostgreSQL);
        Connection connection = conexaoPostgreSQL.getConexao();        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, this.nome);
        preparedStatement.setString(2, this.apelido);
        preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close(); 

    }

    public void carregar() throws SQLException {
        String sql = "SELECT id, nome, apelido FROM garcom WHERE id = ?;";
        
        // aqui entra o singleton
        ConexaoPostgreSQL conexaoPostgreSQL = ConexaoPostgreSQL.getInstance();
         
        // sem singleton
        //ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        
        System.out.println("Hashcode:"+conexaoPostgreSQL);

        Connection connection = conexaoPostgreSQL.getConexao();
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, this.id);
        
        
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()){
            this.setId(rs.getInt("id"));
            this.setApelido(rs.getString("apelido"));
            this.setNome(rs.getString("nome"));            
        }               
        preparedStatement.close();
        connection.close();
    }

    public void update() {

    }

    public void delete() {

    }

    
    
    
}

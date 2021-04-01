/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Usuario {
    private int id;
    private String login;
    private String senha;
    protected Connection con;

    public Usuario(String login, String senha) {
        this.login = login;
        this.senha = senha;
    }

    public Usuario() {
    }

    public String getLogin() {
        return login;
    }

    public String getSenha() {
        return senha;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public boolean save() throws SQLException {
       
        String url = "jdbc:postgresql://localhost:5432/exercicio3";
        this.con = DriverManager.getConnection(url, "postgres", "postgres");
        String sql = "INSERT INTO usuario(login, senha) VALUES (?, ?) RETURNING id;";
        
        PreparedStatement preparedStatement = this.con.prepareStatement(sql);
        preparedStatement.setString(1, this.login);
        preparedStatement.setString(2, this.senha);
  
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()){
            this.id = rs.getInt("id");
            return true;  
        }
        return false;    
        
        
        
    }

    public boolean delete() throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/exercicio3";
        this.con = DriverManager.getConnection(url, "postgres", "postgres");
        String sql = "DELETE FROM usuario WHERE id = ?;";
        
        PreparedStatement preparedStatement = this.con.prepareStatement(sql);
        preparedStatement.setInt(1, this.id);
  
        
        return ((preparedStatement.executeUpdate() == 1));
        
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getId(){
        return this.id;
    }
}

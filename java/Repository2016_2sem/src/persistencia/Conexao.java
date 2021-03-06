/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author iapereira
 */
public class Conexao {
    private static final Conexao CONEXAO = new Conexao();
    private String host;
    private String port;
    private String user;
    private String password;
    private String dbname;
    
    private Conexao(){
        this.host = "localhost";
        this.port =  "5432";
        this.user = "postgres";
        this.password = "postgres";
        this.dbname = "repository";
        
    }
    
    public static Conexao getInstance(){
        return CONEXAO;
    }
    
    public Connection getConnection() throws SQLException {
        String url = "jdbc:postgresql://"+this.host+":"+this.port+"/"+this.dbname;
        return DriverManager.getConnection(url, user, password);
    }
    
}

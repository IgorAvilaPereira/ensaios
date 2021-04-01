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
    private String host;
    private String dbname;
    private String user;
    private String password;
    private String port;
    
    public Conexao(){
        this.host = "localhost";
        this.dbname = "activerecord";
        this.user = "postgres";
        this.password = "postgres";
        this.port = "5432";
        
    }
    
    public Connection getConexao() throws SQLException {
       String url = "jdbc:postgresql://"+this.host+":"+this.port+"/"+this.dbname;
       return DriverManager.getConnection(url, user, password);
    }
    
}

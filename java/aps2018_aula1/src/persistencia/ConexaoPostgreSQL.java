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
public class ConexaoPostgreSQL {
    //private String host;
    private String port;
    private String username;
    private String password;
    private String dbname;
    public static final String HOST = "localhost";
    
    
    public ConexaoPostgreSQL(){
        //this.host = "localhost";
        this.port = "5432";
        this.username = "postgres";
        this.password = "postgres";
        this.dbname = "tinder";
    }
    
    public Connection getConexao() throws SQLException{
        String url = "jdbc:postgresql://"+HOST+":"+port+"/"+dbname; 
        return DriverManager.getConnection(url, username, password);
    }
    
}

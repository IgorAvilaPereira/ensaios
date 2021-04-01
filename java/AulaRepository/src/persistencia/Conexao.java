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
    private String port;
    private String user;
    private String password;
    private String dbname;
    
    // singleton
    private static final Conexao INSTANCE = new Conexao();
    
    private Conexao(){
        this.host = "localhost";
        this.dbname = "aularepository";
        this.user = "postgres";
        this.password = "postgres";
        this.port = "5432";
        
    }
    
    public static Conexao getInstance(){
        return INSTANCE; 
    }
    
    public Connection getConnection(){
               String url = "jdbc:postgresql://"+host+":"+port+"/"+dbname;
        try {
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException e){
            System.out.println("Deu xabum...");
        } 
        return null;
    }
    
}

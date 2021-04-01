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
    private String host;
    private String password;
    private String user;
    private String port;
    private String dbname;
    
    
    public ConexaoPostgreSQL(){
        this.host = "localhost";
        this.password =  "postgres";
        this.user = "postgres";
        this.port = "5432";
        this.dbname = "independencia";
    }
    
    
    public Connection getConexao() throws SQLException, ClassNotFoundException{
        String url = "jdbc:postgresql://"+this.host+":"+this.port+"/"+this.dbname;
        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}

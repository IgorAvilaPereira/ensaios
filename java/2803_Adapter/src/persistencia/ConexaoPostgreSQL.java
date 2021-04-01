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
    protected String host;
    protected String dbname;
    protected String user;
    protected String password;
    protected String port;
    
    public ConexaoPostgreSQL(){
        this.port = "5432";
        //this.user = "postgres";
        //this.password = "postgres";
        this.dbname = "apsoi";
        this.host = "localhost";                
    }
    
    public Connection getConexao() {
        String url = "jdbc:postgresql://"+this.host+":"+this.port+"/"+this.dbname;
        try {
            //System.out.println("Show...tamu conectado....");
            return DriverManager.getConnection(url, user, password);
        } catch(SQLException e){
            System.out.println("Deu xabum na conexao...");
        }
        return null;
    }
    
}

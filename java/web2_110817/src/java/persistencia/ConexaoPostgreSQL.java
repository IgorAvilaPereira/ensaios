/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author iapereira
 */
public class ConexaoPostgreSQL {
    private String host;
    private String port;
    private String user;
    private String password;
    private String dbname;
    
    
    public ConexaoPostgreSQL(){
        this.host = "localhost";
        this.port = "5432";
        this.user = "postgres";
        this.password = "postgres";
        this.dbname = "web2";
    }
    
    public Connection getConnection(){
        String url = "jdbc:postgresql://"+host+":"+port+"/"+dbname;
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("=========================");
            System.out.println("Deu xabum na conexao....");
            System.out.println("=========================");
            Logger.getLogger(ConexaoPostgreSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    
}

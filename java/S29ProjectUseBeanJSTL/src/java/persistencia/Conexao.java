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
public class Conexao {
    private String host;
    private String port;
    private String user;
    private String password;
    private String database;
    
    
    public Conexao(){
        this.database = "s29";
        this.port = "5432";
        this.user = "postgres";
        this.password = "postgres";
        this.host = "localhost";        
    }
    
    public Connection getConnection(){
        String url = "jdbc:postgresql://" + this.host + ":" + this.port + "/" + this.database;
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException ex) {
            System.out.println("Deu xabum....Sem database de garotas hoje garanhao!!!");
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            System.out.println("Problemas no classForName");
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

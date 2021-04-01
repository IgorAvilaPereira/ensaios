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
public class ConexaoPostgtreSQL {
    private String host;
    private String port;
    private String dbname;
    private String user;
    private String password;
    
    
    public Connection getConnection(){
        this.host = "localhost";
        this.port = "5432";
        this.dbname = "tinder";
        this.user = "postgres";
        this.password = "postgres";
        String url = "jdbc:postgresql://"+this.host+":"+this.port+"/"+this.dbname;
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException ex) {
            System.out.println("------------------------------");
            System.out.println("Deu xabum na conexao..");
            System.out.println("-------------------------------");
            Logger.getLogger(ConexaoPostgtreSQL.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexaoPostgtreSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

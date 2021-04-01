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
    private static String host = "localhost";
    private static String user =  "postgres";
    private static String password = "postgres";
    private static String database = "apsoi";
    private static String port = "5432";
    
    private static Connection connection;
    
    private ConexaoPostgreSQL(){
        //this.database = "apsoi";
        //this.host = "localhost";
        //this.password = "postgres";
        //this.port = "5432";
        //this.user = "postgres";
    }
    
    public static Connection getInstance(){
        String url = "jdbc:postgresql://"+ConexaoPostgreSQL.host+":"+ConexaoPostgreSQL.port+"/"+ConexaoPostgreSQL.database;
        try {
            if (ConexaoPostgreSQL.connection == null){
                ConexaoPostgreSQL.connection = DriverManager.getConnection(url, ConexaoPostgreSQL.user, ConexaoPostgreSQL.password);
            }
            return ConexaoPostgreSQL.connection;
        } catch (SQLException ex) {
            System.out.println("Deu xabum....!!");
            Logger.getLogger(ConexaoPostgreSQL.class.getName()).log(Level.SEVERE, null, ex);
            System.exit(0);
        }
        return null;
        
    }
    
}

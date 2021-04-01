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
    private String user;
    private String password;
    private String dbname;
    private String port;
    
    public Conexao(){
        this.host = "localhost";
        this.user = "postgres";
        this.password = "postgres";
        this.dbname = "activerecord";
        this.port = "5432";
    }
    
    
    public Connection getConexao(){
        String url = "jdbc:postgresql://"+this.host+":"+this.port+"/"+this.dbname;
        try {
            //System.out.println("Sucesso na Conexao....");
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException ex) {
            System.out.println("Xabum na Conexao....");
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

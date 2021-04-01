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
    private String porta;
    private String usuario;
    private String senha;
    private String banco;
    
    //private static Connection uniqueConexao;
    
    

    public Conexao() {
        this.host = "localhost";
        this.porta = "5432";
        this.usuario = "postgres";
        this.senha = "postgres";
        this.banco = "revisaooo";
    }

    public Connection getConnection() {
        String url = "jdbc:postgresql://" + this.host + ":" + this.porta + "/" + this.banco;
        try {
            //System.out.println("Deu show...");
            return DriverManager.getConnection(url, this.usuario, this.senha);
        } catch (SQLException ex) {
            //Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Deu xabum na conexao....");
            System.exit(0);
        }
        return null;
    }
}

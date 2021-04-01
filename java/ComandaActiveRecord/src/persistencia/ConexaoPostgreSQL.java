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
    private String database;
    
    // para o singleton sem sync
    //private static ConexaoPostgreSQL conexao = new ConexaoPostgreSQL();
    
    // com sync
    // nao faz nada
    private static ConexaoPostgreSQL conexao;

    
    /*
    public ConexaoPostgreSQL(){
        this.host = "localhost";
        this.port = "5432";
        this.user = "postgres";
        this.password =  "postgres";
        this.database = "comanda";        
    }*/
    
    // para o singleton o construtor deve ser privado
    private ConexaoPostgreSQL(){
        this.host = "localhost";
        this.port = "5432";
        this.user = "postgres";
        this.password =  "postgres";
        this.database = "comanda";        
    }
    
    /*
    // metodo que me retorna a unica instancia de conexao - sem sync
    public static ConexaoPostgreSQL getInstance(){
        return conexao;
    }*/
    
    // com sync
    public static synchronized ConexaoPostgreSQL getInstance(){
        if (conexao == null){
            System.out.println("Entrou de primeira");
            conexao = new ConexaoPostgreSQL();
        } else {
            System.out.println("Jah foi...chama a instancia que jah tem....");
        }
        return conexao;
    }
    
    // com/sem esse metodo eh igual
    public Connection getConexao(){
        String url = "jdbc:postgresql://"+host+":"+port+"/"+database;
        try {
            //System.out.println("Coisa boa...conectei....");
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException ex) {
            System.out.println("Deu xabum na conexao....");
            Logger.getLogger(ConexaoPostgreSQL.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return null;
    }
    
}

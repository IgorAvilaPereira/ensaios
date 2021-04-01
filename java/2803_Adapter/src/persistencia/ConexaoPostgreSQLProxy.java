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
public class ConexaoPostgreSQLProxy extends ConexaoPostgreSQL {
//    private final String user;
//    private final String password;
    
    
    public ConexaoPostgreSQLProxy(String user, String password){
        super();
        super.user = user;
        super.password = password;
    }
    
    
    @Override
    public Connection getConexao() {
        // aiojdaoisdjsaiodjasiodjasiodjosaidjiaow
        return super.getConexao();
    }
    
}

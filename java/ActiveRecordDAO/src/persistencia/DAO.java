/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author iapereira
 * @param <Modelo>
 */
public class DAO<Modelo> {
    protected String sqlDelete;    
    
    public void excluir(int id) throws SQLException{
        Connection connection =  new Conexao().getConexao();
        PreparedStatement sql = connection.prepareStatement(sqlDelete);
        sql.setInt(1, id);
        sql.executeUpdate();   
        sql.close();
        connection.close();
    
    }
}

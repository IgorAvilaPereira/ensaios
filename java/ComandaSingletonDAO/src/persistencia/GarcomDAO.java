/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import negocio.Garcom;

/**
 *
 * @author iapereira
 */
public class GarcomDAO {

    public void create(Garcom garcom) throws SQLException {
        String sql = "INSERT INTO garcom (nome, apelido) VALUES (?, ?);";
        // aqui entra o singleton
        ConexaoPostgreSQL conexaoPostgreSQL = ConexaoPostgreSQL.getInstance();
        // sem singleton
        //ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        System.out.println("Hashcode:"+conexaoPostgreSQL);
        Connection connection = conexaoPostgreSQL.getConexao();        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, garcom.getNome());
        preparedStatement.setString(2, garcom.getApelido());
        preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close(); 

    }

    public Garcom read(int id) throws SQLException {
        String sql = "SELECT id, nome, apelido FROM garcom WHERE id = ?;";
        
// aqui entra o singleton
        ConexaoPostgreSQL conexaoPostgreSQL = ConexaoPostgreSQL.getInstance();
         
        // sem singleton
        //ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        
        System.out.println("Hashcode:"+conexaoPostgreSQL);

        Connection connection = conexaoPostgreSQL.getConexao();
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        
        
        ResultSet rs = preparedStatement.executeQuery();
        Garcom garcom = new Garcom();
        if (rs.next()){
            garcom.setId(rs.getInt("id"));
            garcom.setApelido(rs.getString("apelido"));
            garcom.setNome(rs.getString("nome"));            
        }               
        preparedStatement.close();
        connection.close();         
        return garcom;
    }

    public void update(Garcom garcom) {

    }

    public void delete(int id) {

    }

}

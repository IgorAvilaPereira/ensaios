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
import java.util.ArrayList;
import negocio.Time;

/**
 *
 * @author iapereira
 */
public class TimeDAO {
    
    public ArrayList<Time> listar() throws SQLException{
        String sql = "SELECT * FROM time";
        Connection connection =  new ConexaoPostgreSQL().getConexao();
        ArrayList<Time> vetTime = new ArrayList();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()){
            Time time = new Time();
            time.setId(rs.getInt("id"));
            time.setNome(rs.getString("nome"));
            time.setEndereco(rs.getString("endereco"));
            
            vetTime.add(time);
        }
        preparedStatement.close();
        connection.close();
        return vetTime;
    }
    
    public boolean inserir(Time time) throws SQLException{
        String sql = "INSERT INTO time (nome, endereco) VALUES (?,?);";
        Connection connection = new ConexaoPostgreSQL().getConexao();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, time.getNome());
        preparedStatement.setString(2, time.getEndereco());
        int resultado = preparedStatement.executeUpdate();
        return resultado == 1;
    }
    
}

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
import java.util.List;
import modelo.Cliente;

/**
 *
 * @author iapereira
 */
public class ClienteDAO implements DAO<Cliente> {
    
    public void insert(Cliente modelo) throws SQLException{
        Connection connection =  new Conexao().getConexao();
        String sql = "INSERT INTO cliente (nome) VALUES (?);";
        PreparedStatement sqlInsert = connection.prepareStatement(sql);
        sqlInsert.setString(1, modelo.getNome());
        sqlInsert.executeUpdate();
        connection.close();
    }

    public List<Cliente> executeQueryOO(String where) throws SQLException {
        Connection connection =  new Conexao().getConexao();
        String sql = "SELECT * FROM cliente " + where;
        //System.out.println(sql);
        //System.exit(0);
        PreparedStatement sqlQuery = connection.prepareStatement(sql);
        ResultSet rs = sqlQuery.executeQuery();
        Cliente cliente;
        List<Cliente> vetCliente = new ArrayList();
        while (rs.next()){
            cliente = new Cliente();
            cliente.setId(rs.getInt("id"));
            cliente.setNome(rs.getString("nome"));
            vetCliente.add(cliente);
        }
        sqlQuery.close();
        connection.close();
        return vetCliente;
    }

    public void update(Cliente cliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void remove(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void executeOO(String where) throws SQLException {
        Connection connection =  new Conexao().getConexao();
        String sql = "DELETE FROM cliente "+where;
        PreparedStatement sqlInsert = connection.prepareStatement(sql);        
        sqlInsert.executeUpdate();
        connection.close();
    }
    
}

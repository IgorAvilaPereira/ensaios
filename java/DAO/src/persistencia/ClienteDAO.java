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
import modelo.Endereco;

/**
 *
 * @author iapereira
 */
public class ClienteDAO {
    
    
    
    public void salvar(Cliente cliente) throws SQLException{
        Connection connection =  new Conexao().getConexao();
        String sql = "INSERT INTO cliente (nome) VALUES (?);";
        PreparedStatement sqlInsert = connection.prepareStatement(sql);
        sqlInsert.setString(1, cliente.getNome());
        sqlInsert.executeUpdate();   
        sqlInsert.close();
        connection.close();
    } 
    
    
      public void excluir(int id) throws SQLException{
        Connection connection =  new Conexao().getConexao();
        String sql = "DELETE FROM cliente WHERE id = ?;";
        PreparedStatement sqlDelete = connection.prepareStatement(sql);
        sqlDelete.setInt(1, id);
        sqlDelete.executeUpdate();   
        sqlDelete.close();
        connection.close();
    } 
    
    public List<Cliente> listarTodos() throws SQLException{
        List<Cliente> vetCliente = new ArrayList();
        Connection connection =  new Conexao().getConexao();
        String sql = "SELECT * FROM cliente";
        PreparedStatement sqlSelect = connection.prepareStatement(sql);
        ResultSet rs =  sqlSelect.executeQuery();
        Cliente cliente;
        while (rs.next()){
            cliente =  new Cliente();
            cliente.setId(rs.getInt("id"));
            cliente.setNome(rs.getString("nome"));
            vetCliente.add(cliente);
        }
        sqlSelect.close();
        connection.close();
        return vetCliente;
    }
    
    public void obterEnderecos(Cliente cliente) throws SQLException{
        List<Endereco> vetEndereco = new ArrayList();
        Connection connection =  new Conexao().getConexao();
        String sql = "SELECT * FROM endereco WHERE cliente_id = ?";
        PreparedStatement sqlSelect = connection.prepareStatement(sql);
        sqlSelect.setInt(1, cliente.getId());
        ResultSet rs =  sqlSelect.executeQuery();
        Endereco endereco;
        while (rs.next()){
            endereco =  new Endereco();
            endereco.setId(rs.getInt("id"));
            endereco.setDescricao(rs.getString("descricao"));
            vetEndereco.add(endereco);
        }
        sqlSelect.close();
        connection.close();
        cliente.setVetEndereco(vetEndereco);    
    }

    public Cliente obter(int id) throws SQLException {
        Connection connection =  new Conexao().getConexao();
        String sql = "SELECT * FROM cliente WHERE id = ?";
        PreparedStatement sqlSelect = connection.prepareStatement(sql);
        sqlSelect.setInt(1, id);
        ResultSet rs =  sqlSelect.executeQuery();        
        if(rs.next()){
            Cliente cliente =  new Cliente();
            cliente.setId(rs.getInt("id"));
            cliente.setNome(rs.getString("nome"));
            return cliente;
        }
        sqlSelect.close();
        connection.close();
        return null;
    }
    
}

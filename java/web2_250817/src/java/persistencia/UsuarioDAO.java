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
import modelo.Usuario;

/**
 *
 * @author iapereira
 */
public class UsuarioDAO {
    
    public boolean adicionar(Usuario usuario) throws SQLException{
        ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        Connection connection = conexaoPostgreSQL.getConnection();
        String sql = "INSERT INTO usuario (email, nome, preferencias) VALUES (?, ?, ?);";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, usuario.getEmail());
        preparedStatement.setString(2, usuario.getNome());
        preparedStatement.setString(3, String.valueOf(usuario.getPreferencia()));
        int resultado = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return resultado == 1;
        
    }
    
    
     public boolean alterar(Usuario usuario) throws SQLException{
        ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        Connection connection = conexaoPostgreSQL.getConnection();
        String sql = "UPDATE usuario SET email = ?,  nome = ?, preferencias = ? WHERE id = ?;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, usuario.getEmail());
        preparedStatement.setString(2, usuario.getNome());
        preparedStatement.setString(3, String.valueOf(usuario.getPreferencia()));
        preparedStatement.setInt(4, usuario.getId());
        int resultado = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return resultado == 1;
        
    }
    
    public Usuario obter(int id) throws SQLException{
        Usuario usuario = new Usuario();
        String sql = "SELECT * FROM usuario WHERE id = ?";
        ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        Connection connection = conexaoPostgreSQL.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        ResultSet rs = preparedStatement.executeQuery();
               
        if (rs.next()){
            usuario.setId(rs.getInt("id"));
            usuario.setEmail(rs.getString("email"));
            usuario.setNome(rs.getString("nome"));
            usuario.setPreferencia(rs.getString("preferencias").charAt(0));            
        }
        preparedStatement.close();
        connection.close();
        return usuario;
        
    }
    
    public boolean excluir (int id) throws SQLException {
        ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        Connection connection = conexaoPostgreSQL.getConnection();
        String sql = "DELETE FROM usuario WHERE id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        int resultado = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return resultado == 1;
    }
    
    public ArrayList<Usuario> listar() throws SQLException {
        ArrayList<Usuario> vet = new ArrayList();
        String sql = "SELECT * FROM usuario";
        ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        Connection connection = conexaoPostgreSQL.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        
        
        while(rs.next()){
            Usuario usuario = new Usuario();
            
            usuario.setId(rs.getInt("id"));
            usuario.setEmail(rs.getString("email"));
            usuario.setNome(rs.getString("nome"));
            usuario.setPreferencia(rs.getString("preferencias").charAt(0));
            
            
            vet.add(usuario);
            
        }
        preparedStatement.close();
        connection.close();
        
        return vet;
    }
    
}

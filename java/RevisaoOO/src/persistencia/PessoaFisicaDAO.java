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
import negocio.PessoaFisica;

/**
 *
 * @author iapereira
 */
public class PessoaFisicaDAO implements DAO {
    
    public ArrayList<PessoaFisica> selecionarTodos() throws SQLException{
        ArrayList<PessoaFisica> vetor = new ArrayList();
        String sql = "SELECT * FROM pessoafisica";
        Conexao conexao =  new Conexao();
        Connection connection = conexao.getConnection();
        PreparedStatement selectP = connection.prepareStatement(sql);
        ResultSet rs = selectP.executeQuery();
        while (rs.next()){
            PessoaFisica pessoaFisica =  new PessoaFisica();
            pessoaFisica.setId(rs.getInt("id"));
            pessoaFisica.setCpf(rs.getString("cpf"));
            pessoaFisica.setNome(rs.getString("nome"));
            vetor.add(pessoaFisica);
        }
        selectP.close();
        connection.close();
        return vetor;        
    }
    
    public boolean alterar(PessoaFisica pessoaFisica) throws SQLException{
        Conexao conexao = new Conexao();
        Connection connection =  conexao.getConnection();
        String sqlUpdate = "UPDATE pessoafisica SET nome = ?, cpf = ? WHERE id = ?";
        PreparedStatement updateP = connection.prepareStatement(sqlUpdate);
        updateP.setString(1, pessoaFisica.getNome());
        updateP.setString(2, pessoaFisica.getCpf());
        updateP.setInt(3, pessoaFisica.getId());
        int resultado = updateP.executeUpdate();
        updateP.close();
        connection.close();
        return resultado == 1;        
    }
    
    @Override
    public boolean excluir(int id) throws SQLException{
        Conexao conexao = new Conexao();        
        Connection connection = conexao.getConnection();
        String sqlDelete = "DELETE FROM pessoafisica WHERE id = ?";
        PreparedStatement deleteP = connection.prepareStatement(sqlDelete);
        deleteP.setInt(1, id);
        int resultado = deleteP.executeUpdate();
        deleteP.close();
        connection.close();
        return resultado == 1;
        
    }
    
    @Override
    public boolean inserir(Object objeto) throws SQLException{
        PessoaFisica pessoaFisica = (PessoaFisica) objeto;
        Conexao conexao =  new Conexao();
        int resultado;
        // fazer o inserir
        try (Connection connection = conexao.getConnection()) {
            // fazer o inserir
            String sql = "INSERT INTO "
                    + "pessoafisica (nome, cpf) VALUES (?, ?);";
            try (PreparedStatement sqlP = connection.prepareStatement(sql)) {
                sqlP.setString(1, pessoaFisica.getNome());
                sqlP.setString(2, pessoaFisica.getCpf());
                resultado = sqlP.executeUpdate();
            }
        }
        return resultado == 1;
    }

   
    
}

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
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Pessoa;

/**
 *
 * @author iapereira
 */
public class PessoaDAO implements DAO<Pessoa> {

    @Override
    public void inserir(Pessoa obj) {
        String sql = "INSERT INTO pessoa (nome, sexo, preferencias) VALUES (?,?,?);";
        try {
            Connection connection = new ConexaoPostgtreSQL().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, obj.getNome());
            preparedStatement.setString(2, String.valueOf(obj.getSexo()));
            preparedStatement.setString(3, obj.getPreferencias());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(PessoaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void excluir(int vet[]) {
        String aux = "DELETE FROM pessoa WHERE id in (";
        for (int i = 0; i < vet.length; i++) {
            aux += vet[i] + ",";
        }
        aux += ")";
        String sql = aux.replace(",)", ")");
        Connection connection = new ConexaoPostgtreSQL().getConnection();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(PessoaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void excluir(int id) {
        String sql = "DELETE FROM pessoa WHERE id = ?;";
        Connection connection = new ConexaoPostgtreSQL().getConnection();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(PessoaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void atualizar(Pessoa obj) {
         String sql = "UPDATE pessoa SET nome = ?, sexo = ?, preferencias = ? WHERE id = ?;";
        try {
            Connection connection = new ConexaoPostgtreSQL().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, obj.getNome());
            preparedStatement.setString(2, String.valueOf(obj.getSexo()));
            preparedStatement.setString(3, obj.getPreferencias());
            preparedStatement.setInt(4, obj.getId());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(PessoaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<Pessoa> listar() {
        String sql = "SELECT * FROM pessoa;";
        Connection connection = new ConexaoPostgtreSQL().getConnection();
        ArrayList<Pessoa> vetPessoa = new ArrayList<>();
        PreparedStatement sqlPreparedStatement;
        try {
            sqlPreparedStatement = connection.prepareStatement(sql);
            ResultSet rs = sqlPreparedStatement.executeQuery();
            while (rs.next()) {
                Pessoa pessoa = new Pessoa();
                pessoa.setId(rs.getInt("id"));
                pessoa.setNome(rs.getString("nome"));
                pessoa.setPreferencias(rs.getString("preferencias"));
                String sexo = rs.getString("sexo");
                pessoa.setSexo(((sexo == null) ? 'N' : sexo.charAt(0)));
                vetPessoa.add(pessoa);

            }
        } catch (SQLException ex) {
            Logger.getLogger(PessoaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vetPessoa;

    }

    @Override
    public Pessoa carregar(int id) {
        String sql = "SELECT * FROM pessoa WHERE id = ?;";
        Connection connection = new ConexaoPostgtreSQL().getConnection();
        PreparedStatement sqlPreparedStatement;
        Pessoa pessoa = new Pessoa();

        try {
            sqlPreparedStatement = connection.prepareStatement(sql);
            sqlPreparedStatement.setInt(1, id);
            ResultSet rs = sqlPreparedStatement.executeQuery();
            if (rs.next()) {
                pessoa.setId(rs.getInt("id"));
                pessoa.setNome(rs.getString("nome"));
                pessoa.setPreferencias(rs.getString("preferencias"));
                String sexo = rs.getString("sexo");
                pessoa.setSexo(((sexo == null) ? 'N' : sexo.charAt(0)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(PessoaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pessoa;

    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import persistencia.ConexaoPostgreSQL;

/**
 *
 * @author iapereira
 */
public class ForcaArmada {

    private int id;
    private String nome;
    private int efetivo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getEfetivo() {
        return efetivo;
    }

    public void setEfetivo(int efetivo) {
        this.efetivo = efetivo;
    }

    public boolean adicionar() throws SQLException, ClassNotFoundException {
        Connection connection = new ConexaoPostgreSQL().getConexao();
        String sql = "INSERT INTO forcaarmada(nome, efetivo) VALUES (?, ?) RETURNING id";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, this.nome);
        preparedStatement.setInt(2, this.efetivo);
        ResultSet rs = preparedStatement.executeQuery();
        int resultado = 0;
        if (rs.next()) {
            this.id = rs.getInt("id");
            resultado = 1;
        }
        preparedStatement.close();
        connection.close();
        return resultado == 1;
    }

    public static ArrayList<ForcaArmada> listar() throws SQLException, ClassNotFoundException {
        ArrayList<ForcaArmada> vet = new ArrayList();
        String sql = "SELECT * FROM forcaarmada";
        Connection connection = new ConexaoPostgreSQL().getConexao();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            ForcaArmada forcaArmada = new ForcaArmada();
            forcaArmada.setId(rs.getInt("id"));
            forcaArmada.setNome(rs.getString("nome"));
            forcaArmada.setEfetivo(rs.getInt("efetivo"));
            vet.add(forcaArmada);
        }
        preparedStatement.close();
        connection.close();
        return vet;
    }

    public boolean excluir() throws SQLException, ClassNotFoundException {
        Connection connection = new ConexaoPostgreSQL().getConexao();
        String sql = "DELETE FROM forcaarmada WHERE id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, this.id);
        int resultado = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return resultado == 1;
    }

    public void carregar() throws SQLException, ClassNotFoundException {

        ArrayList<ForcaArmada> vet = new ArrayList();
        String sql = "SELECT * FROM forcaarmada WHERE id = ?";
        Connection connection = new ConexaoPostgreSQL().getConexao();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, this.id);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            this.setId(rs.getInt("id"));
            this.setNome(rs.getString("nome"));
            this.setEfetivo(rs.getInt("efetivo"));
        }
        preparedStatement.close();
        connection.close();
    }

    public boolean atualizar() throws SQLException, ClassNotFoundException {
        Connection connection = new ConexaoPostgreSQL().getConexao();
        String sql = "UPDATE forcaarmada SET nome = ?, efetivo = ? WHERE id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, this.nome);
        preparedStatement.setInt(2, this.efetivo);
        preparedStatement.setInt(3, this.id);
        int resultado = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return resultado == 1;
    }
}

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
public class Endereco {

    private int id;
    private String bairro;
    private String logradouro;
    private String numero;
    private String complemento;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public static ArrayList<Endereco> listar() throws SQLException, ClassNotFoundException {
        String sql = "select * from endereco";
        Connection connection = new ConexaoPostgreSQL().getConexao();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        ArrayList<Endereco> vetEndereco = new ArrayList<>();
        while (rs.next()) {
            Endereco endereco = new Endereco();
            endereco.setId(rs.getInt("id"));
            endereco.setBairro(rs.getString("bairro"));
            // fazer para os demais...
            vetEndereco.add(endereco);
        }
        return vetEndereco;
    }

    public boolean excluir() throws SQLException, ClassNotFoundException {
        String sql = "DELETE from endereco where id = ?";
        Connection connection = new ConexaoPostgreSQL().getConexao();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, this.id);
        int resultado = preparedStatement.executeUpdate();
        return resultado == 1;
    }

}

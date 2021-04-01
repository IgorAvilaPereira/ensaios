/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author iapereira
 */
public class Pessoa {

    // atributos do modelo
    private int id;
    private String nome;
    private Endereco endereco;

    // parametros de conexao
    private String user;
    private String password;
    private String dbname;
    private String port;
    private String url;
    private String host;

    public Pessoa() {
        this.endereco = null;
        this.host = "localhost";
        this.user = "postgres";
        this.password = "postgres";
        this.dbname = "proxy";
        this.port = "5432";
        this.url = "jdbc:postgresql://" + host + ":" + port + "/" + dbname;

    }

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

    public Endereco getEndereco2() {
        return this.endereco;
    }

    public Endereco getEndereco() throws SQLException {
        if (this.endereco == null) {
            Connection connection = DriverManager.getConnection(url, user, password);
            String sql = "select * from enderecos WHERE pessoa_id = ?";
            PreparedStatement sqlPreparedStatement = connection.prepareStatement(sql);
            sqlPreparedStatement.setInt(1, this.id);
            ResultSet rs = sqlPreparedStatement.executeQuery();
            if (rs.next()) {
                this.endereco = new Endereco();
                this.endereco.setCep(rs.getString("cep"));
                this.endereco.setId(rs.getInt("id"));
                this.endereco.setLogradouro(rs.getString("logradouro"));
                this.endereco.setNumero(rs.getInt("numero"));
            }
        }
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public void load() throws SQLException {
        Connection connection = DriverManager.getConnection(url, user, password);
        String sql = "select * from pessoas WHERE id = ?";
        PreparedStatement sqlPreparedStatement = connection.prepareStatement(sql);
        sqlPreparedStatement.setInt(1, this.id);
        ResultSet rs = sqlPreparedStatement.executeQuery();
        if (rs.next()) {
            this.id = rs.getInt("id");
            this.nome = rs.getString("nome");
        }

    }

}

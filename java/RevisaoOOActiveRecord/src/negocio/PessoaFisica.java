/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import persistencia.Conexao;

/**
 *
 * @author iapereira
 */
public class PessoaFisica extends Pessoa {

    private String cpf;

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    @Override
    public void executarProtecao() {
        System.out.println("Pessoa Fisica disparando seu método de proteção...");
        System.out.println(this.nome);
        protecao.proteger();

    }

    @Override
    public String toString() {
        return this.id + ";" + this.cpf + ";" + this.nome;
    }
    
    public static ArrayList<PessoaFisica> selecionarTodos() throws SQLException {
        ArrayList<PessoaFisica> vetor = new ArrayList();
        String sql = "SELECT * FROM pessoafisica";
        Conexao conexao = new Conexao();
        Connection connection = conexao.getConnection();
        PreparedStatement selectP = connection.prepareStatement(sql);
        ResultSet rs = selectP.executeQuery();
        while (rs.next()) {
            PessoaFisica pessoaFisica = new PessoaFisica();
            pessoaFisica.setId(rs.getInt("id"));
            pessoaFisica.setCpf(rs.getString("cpf"));
            pessoaFisica.setNome(rs.getString("nome"));
            vetor.add(pessoaFisica);
        }
        selectP.close();
        connection.close();
        return vetor;
    }

    public void carregar() throws SQLException {
        String sql = "SELECT * FROM pessoafisica WHERE id = ?;";
        Conexao conexao = new Conexao();
        Connection connection = conexao.getConnection();
        PreparedStatement selectP = connection.prepareStatement(sql);
        selectP.setInt(1, this.id);
        ResultSet rs = selectP.executeQuery();
        if (rs.next()) {
            this.id = rs.getInt("id");
            this.cpf = rs.getString("cpf");
            this.nome = rs.getString("nome");
        }
        selectP.close();
        connection.close();
    }

    public boolean alterar() throws SQLException {
        Conexao conexao = new Conexao();
        Connection connection = conexao.getConnection();
        String sqlUpdate = "UPDATE pessoafisica SET nome = ?, cpf = ? WHERE id = ?";
        PreparedStatement updateP = connection.prepareStatement(sqlUpdate);
        updateP.setString(1, this.nome);
        updateP.setString(2, this.cpf);
        updateP.setInt(3, this.id);
        int resultado = updateP.executeUpdate();
        updateP.close();
        connection.close();
        return resultado == 1;
    }

    public boolean excluir() throws SQLException {
        Conexao conexao = new Conexao();
        Connection connection = conexao.getConnection();
        String sqlDelete = "DELETE FROM pessoafisica WHERE id = ?";
        PreparedStatement deleteP = connection.prepareStatement(sqlDelete);
        deleteP.setInt(1, this.id);
        int resultado = deleteP.executeUpdate();
        deleteP.close();
        connection.close();
        return resultado == 1;

    }

    
    public boolean salvar() throws SQLException {        
        Conexao conexao = new Conexao();
        int resultado;
        // fazer o inserir
        try (Connection connection = conexao.getConnection()) {
            // fazer o inserir
            String sql = "INSERT INTO "
                    + "pessoafisica (nome, cpf) VALUES (?, ?);";
            try (PreparedStatement sqlP = connection.prepareStatement(sql)) {
                sqlP.setString(1, this.nome);
                sqlP.setString(2, this.cpf);
                resultado = sqlP.executeUpdate();
            }
        }
        return resultado == 1;
    }
    public static ArrayList<PessoaFisica> selecionarcomecandoy() throws SQLException {
        ArrayList<PessoaFisica> vetor = new ArrayList();
        String sql = "SELECT * FROM pessoafisica where nome ilike 'Y%'";
        Conexao conexao = new Conexao();
        Connection connection = conexao.getConnection();
        PreparedStatement selectP = connection.prepareStatement(sql);
        ResultSet rs = selectP.executeQuery();
        while (rs.next()) {
            PessoaFisica pessoaFisica = new PessoaFisica();
            pessoaFisica.setId(rs.getInt("id"));
            pessoaFisica.setCpf(rs.getString("cpf"));
            pessoaFisica.setNome(rs.getString("nome"));
            vetor.add(pessoaFisica);
        }
        selectP.close();
        connection.close();
        return vetor;
    }

}

package negocio;

import persistencia.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Usuario {

   
    private int id;
    private final String login;
    private final String senha;

    public Usuario(String login, String senha) {
        this.login = login;
        this.senha = senha;
    }

    public Usuario(int id, String login, String senha) {
        this.id = id;
        this.login = login;
        this.senha = senha;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

    public String getLogin() {
        return login;
    }

    public String getSenha() {
        return senha;
    }

    public void save() throws SQLException {
        try (Connection connection = new Conexao().getConexao(); PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO usuario (login, senha) VALUES (?, md5(?)) RETURNING id;")) {
            preparedStatement.setString(1, this.login);
            preparedStatement.setString(2, this.senha);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()){
                this.id = rs.getInt("id");
            }
        }
    }
    public boolean delete() throws SQLException {
        int resultado;
        try (Connection connection = new Conexao().getConexao(); PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM usuario WHERE id = ?")) {
            preparedStatement.setInt(1, this.id);
            resultado = preparedStatement.executeUpdate();
        }
        return (resultado == 1);
        
    }

    public int getId() {
        return this.id;
    }
    
     public static ArrayList<Usuario> listarTodos() throws SQLException {
         ArrayList<Usuario> vet = new ArrayList<>();
           try (Connection connection = new Conexao().getConexao(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM usuario;")) {
            
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                vet.add(new Usuario(rs.getInt("id"), rs.getString("login"), rs.getString("senha")));
            }
        }
           return vet;
    }
}

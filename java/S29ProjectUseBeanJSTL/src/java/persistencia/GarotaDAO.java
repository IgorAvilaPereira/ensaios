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
import modelo.Garota;

/**
 *
 * @author iapereira
 */
public class GarotaDAO {
    
      public boolean alterar(Garota garota) throws SQLException {        
        Connection connection = new Conexao().getConnection();
        String sql = "UPDATE garota SET apelido = ?,  bumbum = ?, valor = ?, altura = ? WHERE id = ?;";

        PreparedStatement sqlP = connection.prepareStatement(sql);

        sqlP.setString(1, garota.getApelido());
        sqlP.setDouble(2, garota.getBumbum());
        sqlP.setDouble(3, garota.getValorPorHora());
        sqlP.setDouble(4, garota.getAltura());
        sqlP.setInt(5, garota.getId());
        
        int resultado = sqlP.executeUpdate();

        sqlP.close();
        connection.close();
        return resultado == 1;

    }

    public Garota obter(int id) throws SQLException {
        Garota garota = new Garota();
        Connection connection = new Conexao().getConnection();
        String sql = "SELECT * FROM garota WHERE id = ?;";
        PreparedStatement sqlP = connection.prepareStatement(sql);
        sqlP.setInt(1, id);
        ResultSet rs = sqlP.executeQuery();
        if (rs.next()) {
            garota.setId(rs.getInt("id"));
            garota.setApelido(rs.getString("apelido"));
            garota.setAltura(rs.getDouble("altura"));
            garota.setBumbum(rs.getDouble("bumbum"));
            garota.setValorPorHora(rs.getDouble("valor"));
        }
        sqlP.close();
        connection.close();
        return garota;
    }

    public boolean excluir(int id) throws SQLException {

        Connection connection = new Conexao().getConnection();
        String sql = "DELETE FROM garota WHERE id = ?;";

        PreparedStatement sqlP = connection.prepareStatement(sql);

        sqlP.setInt(1, id);
        int resultado = sqlP.executeUpdate();

        sqlP.close();
        connection.close();
        return resultado == 1;

    }

    public boolean adicionar(Garota garota) throws SQLException {
        ArrayList<Garota> vetGarota = new ArrayList();
        Connection connection = new Conexao().getConnection();
        String sql = "INSERT INTO garota (apelido, bumbum, valor, altura) VALUES (?,?,?,?)";

        PreparedStatement sqlP = connection.prepareStatement(sql);

        sqlP.setString(1, garota.getApelido());
        sqlP.setDouble(2, garota.getBumbum());
        sqlP.setDouble(3, garota.getValorPorHora());
        sqlP.setDouble(4, garota.getAltura());

        int resultado = sqlP.executeUpdate();

        sqlP.close();
        connection.close();
        return resultado == 1;

    }

    public ArrayList<Garota> selecionarTodos() throws SQLException {
        ArrayList<Garota> vetGarota = new ArrayList();
        Connection connection = new Conexao().getConnection();
        String sql = "SELECT * FROM garota ORDER BY id";
        PreparedStatement sqlP = connection.prepareStatement(sql);
        ResultSet rs = sqlP.executeQuery();
        while (rs.next()) {
            Garota garota = new Garota();
            garota.setId(rs.getInt("id"));
            garota.setApelido(rs.getString("apelido"));
            garota.setAltura(rs.getDouble("altura"));
            garota.setBumbum(rs.getDouble("bumbum"));
            garota.setValorPorHora(rs.getDouble("valor"));
            vetGarota.add(garota);
        }
        return vetGarota;

    }

}

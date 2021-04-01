package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import negocio.*;

/**
 *
 * @author iapereira
 */
public class TimeDAO implements Dao<Time> {

    @Override
    public Time carregar(int id) throws SQLException {
        Connection connection = new ConexaoPostgreSQL().getConnection();
        String sql = "SELECT * FROM time WHERE id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        Time time = new Time();
        if (rs.next()) {
            time.setId(rs.getInt("id"));
            time.setNome(rs.getString("nome"));
            time.setEndereco(rs.getString("endereco"));
        }
        rs.close();
        preparedStatement.close();
        connection.close();
        return time;
    }

    @Override
    public boolean alterar(Time modelo) throws SQLException {
        Connection connection = new ConexaoPostgreSQL().getConnection();
        String sql = "UPDATE time set nome = ?,  endereco = ? WHERE id = ?;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, modelo.getNome());
        preparedStatement.setString(2, modelo.getEndereco());
        preparedStatement.setInt(3, modelo.getId());
        int resultado = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return resultado == 1;
    }

    @Override
    public boolean excluir(int id) throws SQLException {
        Connection connection = new ConexaoPostgreSQL().getConnection();
        String sql = "DELETE FROM time WHERE id = ?;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        int resultado = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return resultado == 1;

    }

    @Override
    public boolean adicionar(Time modelo) throws SQLException {
        Connection connection = new ConexaoPostgreSQL().getConnection();
        String sql = "INSERT INTO time (nome, endereco) VALUES (?, ?);";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, modelo.getNome());
        preparedStatement.setString(2, modelo.getEndereco());
        int resultado = preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
        return resultado == 1;
    }

    @Override
    public ArrayList<Time> listar() throws SQLException {
        Connection connection = new ConexaoPostgreSQL().getConnection();
        String sql = "SELECT * FROM time";
        ResultSet rs = connection.createStatement().executeQuery(sql);
        ArrayList<Time> vetTime = new ArrayList();
        while (rs.next()) {
            Time time = new Time();
            time.setId(rs.getInt("id"));
            time.setNome(rs.getString("nome"));
            time.setEndereco(rs.getString("endereco"));
            vetTime.add(time);
        }
        rs.close();
        connection.close();
        return vetTime;
    }
}
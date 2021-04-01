package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.Anotacao;

/**
 *
 * @author iapereira
 */
public class AnotacaoDAO implements DAO<Anotacao> {

    @Override
    public ArrayList<Anotacao> listar() throws SQLException {
        ArrayList<Anotacao> vetAnotacao = new ArrayList();
        Connection connection = ConexaoPostgreSQL.getConnection();
        System.out.println("HashCode Connection:" + connection.hashCode());
        String sql = "select * from anotacao;";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Anotacao anotacao = new Anotacao();
            anotacao.setId(rs.getInt("id"));
            anotacao.setTitulo(rs.getString("titulo"));
            anotacao.setDescricao(rs.getString("descricao"));
            anotacao.setLixeira(rs.getBoolean("lixeira"));
            vetAnotacao.add(anotacao);
        }
        ps.close();
        return vetAnotacao;
    }

    @Override
    public void inserir(Anotacao anotacao) throws SQLException {
        Connection connection = ConexaoPostgreSQL.getConnection();
        System.out.println("HashCode Connection:" + connection.hashCode());
        String sql = "INSERT INTO anotacao (titulo, descricao) VALUES (?,?);";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, anotacao.getTitulo());
        ps.setString(2, anotacao.getDescricao());
        ps.execute();
        ps.close();
    }

    @Override
    public void alterar(Anotacao anotacao) throws SQLException {
        Connection connection = ConexaoPostgreSQL.getConnection();
        System.out.println("HashCode Connection:" + connection.hashCode());
        String sql = "UPDATE anotacao SET titulo = ?, descricao = ? WHERE id = ?;";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, anotacao.getTitulo());
        ps.setString(2, anotacao.getDescricao());
        ps.setInt(3, anotacao.getId());
        ps.execute();
    }
}

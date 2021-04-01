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
import java.util.List;
import negocio.Pessoa;

/**
 *
 * @author iapereira
 */
public class PessoaDAO implements DAO<Pessoa> {

    @Override
    public void inserir(Pessoa modelo) {
        try {
            Connection connection = Conexao.getInstance().getConnection();
            String sql = "INSERT INTO pessoa( nome, sobrenome) VALUES (?, ?);";
            PreparedStatement instrucao = connection.prepareStatement(sql);
            instrucao.setString(1, modelo.getNome());
            instrucao.setString(2, modelo.getSobrenome());
            instrucao.executeUpdate();
            instrucao.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("Deu xabum no insert...");
        }
    }

    @Override
    public void deletar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Pessoa modelo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Pessoa> executePesquisa(String consulta) {
        List<Pessoa> vetPessoa = new ArrayList();
        try {
            Connection connection = Conexao.getInstance().getConnection();
            PreparedStatement instrucao = connection.prepareStatement(consulta);
            ResultSet rs = instrucao.executeQuery();
            while (rs.next()){
                Pessoa pessoa =  new Pessoa();
                pessoa.setId(rs.getInt("id"));
                pessoa.setNome(rs.getString("nome"));
                pessoa.setSobrenome(rs.getString("sobrenome"));
                vetPessoa.add(pessoa);
            }            
        } catch (SQLException e) {
            System.out.println("Deu xabum no executePesquisa kkkk...");
        }
        return vetPessoa;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Perfil;

/**
 *
 * @author iapereira
 */
public class PerfilDAO implements IDAO<Perfil>{

    @Override
    public void inserir(Perfil t) {
        try {
            try (Connection connection = new ConexaoPostgreSQL().getConexao()) {
                String sql =  "insert into perfil (nome, sexo, idade) values (?, ? ,?);";
                PreparedStatement p = connection.prepareStatement(sql);
                p.setString(1, t.getNome());
                p.setString(2, String.valueOf(t.getSexo()));
                p.setInt(3, t.getIdade());
                p.executeUpdate();
                p.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(PerfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

    @Override
    public void excluir(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

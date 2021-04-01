/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;
import negocio.Pessoa;

/**
 *
 * @author iapereira
 */
public class PessoaDAO extends DAO<Pessoa> {
    
    public PessoaDAO (){
        super();
        super.setSelect("SELECT * FROM pessoa ");
        super.setDelete("DELETE FROM pessoa ");
    }

    @Override
    public Pessoa preparaObjeto(ResultSet rs) throws SQLException {
        Pessoa pessoa = new Pessoa();
        pessoa.setId(rs.getInt(Pessoa.ID));
        pessoa.setNome(rs.getString(Pessoa.NOME));
        pessoa.setSobrenome(rs.getString(Pessoa.SOBRENOME));
        return pessoa;
    }
    
    
    
}

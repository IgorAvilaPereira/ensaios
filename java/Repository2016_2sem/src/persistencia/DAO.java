/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author iapereira
 * @param <Modelo>
 */
public abstract class DAO<Modelo> {
    private String select;
    private String delete;
    private Connection conexao;

    public void setSelect(String select) {
        this.select = select;
    }

    public String getSelect() {
        return select;
    }    
    
    public abstract Modelo preparaObjeto(ResultSet rs) throws SQLException; 
    
    public int executeUpdate(String consulta) throws SQLException{
        this.conexao = Conexao.getInstance().getConnection();
        int resultado = conexao.createStatement().executeUpdate(consulta);
        return resultado;        
    }
    
    public List<Modelo> executeQuery(String consulta) throws SQLException {
        this.conexao = Conexao.getInstance().getConnection();
        ResultSet rs = conexao.createStatement().executeQuery(consulta);
        List<Modelo> vetModelo = new ArrayList();
        while (rs.next()){
            vetModelo.add(this.preparaObjeto(rs));
        }
        conexao.close();
        rs.close();
        return vetModelo;
    }

    public void setDelete(String delete) {
        this.delete = delete;
    }
    
    public String getDelete(){
        return this.delete;
    }
    
}

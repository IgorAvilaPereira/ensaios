/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.SQLException;

/**
 *
 * @author iapereira
 */
public interface DAO {
    boolean excluir(int id) throws SQLException;
    boolean inserir(Object objeto) throws SQLException;
    // assim para todos os metodos...: seleccionar, excluir...
    
}

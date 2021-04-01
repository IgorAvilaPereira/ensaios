/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
interface DAO<T> {
    ArrayList<T> listar() throws SQLException;
    void inserir(T t) throws SQLException;
    void alterar(T t) throws SQLException;
    
}

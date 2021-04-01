/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repositorio;

import java.sql.SQLException;
import modelo.Cliente;

/**
 *
 * @author iapereira
 */
interface IRepository<Modelo> {
    
    void create(Modelo modelo) throws SQLException;
    
    void update(Modelo modelo) throws SQLException;
    
    void remove(Modelo modelo) throws SQLException;
    
}

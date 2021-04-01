/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.util.List;

/**
 *
 * @author iapereira
 */
public interface DAO<Modelo> {
    void inserir(Modelo modelo);
    void deletar(int id);
    void update(Modelo modelo);
    List<Modelo> executePesquisa(String consulta);
    
}

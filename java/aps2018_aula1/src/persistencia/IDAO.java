/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

/**
 *
 * @author iapereira
 */
public interface IDAO<T> {
    
    public void inserir(T t);
    public void excluir(int id);
    
}

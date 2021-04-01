/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public interface DAO<T> {
    
    public T carregar(int id);
    public void inserir(T obj);
    public void excluir(int id);
    public void atualizar(T obj);
    public ArrayList<T> listar();
    
}

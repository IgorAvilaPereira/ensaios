/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author iapereira
 */
public abstract class Coquetel {
    protected String nome;
    protected double preco;
    
    public abstract double getPreco();
    public abstract String getNome();
    
}

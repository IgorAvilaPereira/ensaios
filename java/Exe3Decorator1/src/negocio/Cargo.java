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
public abstract class Cargo {
    protected double salario;
    //protected String nome;
    
    public Cargo(){
        this.salario = 1000;
    }
    
    public abstract double calcSalario();    
    public abstract String mostraNome();
    
    
    
}

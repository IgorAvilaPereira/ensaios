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
public abstract class Incorporados extends Cargo {
    
    protected Cargo prox;
    
    public Incorporados(Cargo prox){
        this.prox =  prox;
    }
    
    /*
    public void setProx(Cargo prox){
        this.prox = prox;
    }*/
    
    @Override
    public abstract double calcSalario();    
    @Override
    public abstract String mostraNome();

}

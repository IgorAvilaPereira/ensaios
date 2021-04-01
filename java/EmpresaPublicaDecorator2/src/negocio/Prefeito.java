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
public class Prefeito extends Incorporados {
    
    public Prefeito(Cargo prox){
        super(prox);        
    }

    @Override
    public double calcSalario() {
        return prox.calcSalario() + 4000;
    }

    @Override
    public String mostraNome() {
        return prox.mostraNome() + "\n - Prefeito";
    }
    
}

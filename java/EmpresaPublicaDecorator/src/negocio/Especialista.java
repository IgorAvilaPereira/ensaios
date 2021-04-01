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
public class Especialista extends Cargo {

    private final double base;
    
    public Especialista(){
        super();
        this.base = 2500;
    }

    @Override
    public double calcSalario() {
       return this.base + super.inicial;
    }

    @Override
    public String mostraNome() {
        return "Especialista";
    }
    
}

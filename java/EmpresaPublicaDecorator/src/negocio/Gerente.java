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
public class Gerente extends Cargo {

    private double base;
    
    public Gerente(){
        super();
        this.base = 3000;
    }

    @Override
    public double calcSalario() {
       return this.base + super.inicial;
    }

    @Override
    public String mostraNome() {
        return "Gerente";
    }
    
}

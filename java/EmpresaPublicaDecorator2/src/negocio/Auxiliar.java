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
public class Auxiliar extends Cargo {

    @Override
    public double calcSalario() {
        return this.inicial + 1000;
    }

    @Override
    public String mostraNome() {
        return "- Auxiliar";
    }
    
}

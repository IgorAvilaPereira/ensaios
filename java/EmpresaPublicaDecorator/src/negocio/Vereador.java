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
public class Vereador extends Incorporados {

    public Vereador(Cargo cargo) {
        super(cargo);
    }

    @Override
    public double calcSalario() {
        return super.cargo.calcSalario() + 5000;
    }

    @Override
    public String mostraNome() {
        
        return "Vereador \n" + super.cargo.mostraNome();
    }
    
}

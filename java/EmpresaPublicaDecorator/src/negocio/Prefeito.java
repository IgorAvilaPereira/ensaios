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

    public Prefeito(Cargo cargo) {
        super(cargo);
    }

   

    @Override
    public double calcSalario() {
        return super.cargo.calcSalario() + 4000;
    }

    @Override
    public String mostraNome() {
        return "Prefeito \n" + super.cargo.mostraNome();
    }
    
}

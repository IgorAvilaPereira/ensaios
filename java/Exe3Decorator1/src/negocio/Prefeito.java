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
    
    public Prefeito(Cargo cargo){
        super(cargo);
        //super.setProx(cargo);
    }

    @Override
    public double calcSalario() {
        return 4000.0 + super.prox.calcSalario();
    }

    @Override
    public String mostraNome() {
        return "Prefeito " + super.prox.mostraNome();
        
    }
    
}

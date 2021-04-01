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
public class Refrigerante extends CoquetelDecorator {
    
    public Refrigerante(Coquetel umCoquetel){
        super(umCoquetel);
    }

    @Override
    public double getPreco() {
        return 5.0 + super.umCoquetel.getPreco();
    }

    @Override
    public String getNome() {
        return "Refrigerante " + super.umCoquetel.getNome();
    }
    
}

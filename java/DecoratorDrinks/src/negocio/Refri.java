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
public class Refri extends CoquetelDecorator {

    public Refri(Coquetel umCoquetel) {
        super(umCoquetel);
    }

    
    
    @Override
    public String getNome() {
        return umCoquetel.getNome() +  ", Refri";
    }

    @Override
    public double getPreco() {
        return umCoquetel.getPreco() +  10.0;
    }
    
}

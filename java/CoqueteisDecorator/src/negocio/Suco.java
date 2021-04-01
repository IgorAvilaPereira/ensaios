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
public class Suco extends CoqDecorator {

    public Suco(Coquetel umCoquetel) {
        super(umCoquetel);
    }

    @Override
    public String getNome() {
        return "Suco " + umCoquetel.getNome();
    }

    @Override
    public double getPreco() {
        return 6.0 + umCoquetel.getPreco();
    }

}

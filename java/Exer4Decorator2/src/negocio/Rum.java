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
public class Rum extends Coquetel {

    @Override
    public double getPreco() {
        return 10.0;
    }

    @Override
    public String getNome() {
        return "Rum";
    }
    
}

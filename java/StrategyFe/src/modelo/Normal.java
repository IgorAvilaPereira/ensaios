/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author iapereira
 */
public class Normal implements Promocao {

    public Normal() {
    }

    @Override
    public double descontar() {
        return 1.0;
    }
    
}

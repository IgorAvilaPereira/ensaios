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
public class MotoAdapter implements Carro {
    Moto moto;

    public MotoAdapter(Moto moto) {
        this.moto = moto;
    }

    
    
    @Override
    public void volante() {
        this.moto.guidao();
    }

    @Override
    public void quatroCarro() {
        this.moto.duasRodas();
    }
    
    
}

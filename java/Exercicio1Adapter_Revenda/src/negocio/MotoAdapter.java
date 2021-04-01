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
    
    private Moto motoca;

    public MotoAdapter(Moto motoca) {
        this.motoca = motoca;
    }    

    @Override
    public void quatroRodas() {
        this.motoca.duasRodas();
    }

    @Override
    public void Volante() {
        this.motoca.guidao();
    }
    
}

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
public class MarioMorto implements MarioState {

    public MarioMorto() {
    }

    @Override
    public MarioState pegarCogumelo() {
        return this;
    }

    @Override
    public MarioState levouDano() {
        return this;
    }

    @Override
    public MarioState pegarPena() {
        return this;
    }

    @Override
    public MarioState pegarFlor() {
        return this;
    }
    
}

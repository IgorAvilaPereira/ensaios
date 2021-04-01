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

    @Override
    public MarioState pegarCogumelo() {
        System.out.println("Morreu");
        return this;
    }

    @Override
    public MarioState pegarFlor() {
        System.out.println("Morreu");
        return this;
    }

    @Override
    public MarioState pegarPena() {
        System.out.println("Morreu");
        return this;
    }

    @Override
    public MarioState levarDano() {
        System.out.println("Morreu");
        return this;
    }
}

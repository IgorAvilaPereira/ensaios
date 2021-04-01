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
public class MarioPena implements MarioState {

    
    @Override
    public MarioState pegarCogumelo() {
        return this;
    }

    @Override
    public MarioState pegarFlor() {
        System.out.println("Fogo....");
        return new MarioFogo();
    }

    @Override
    public MarioState levarDano() {
        System.out.println("Fiquei grande. perdi a pena...");
        return new MarioGrande();
    }

    @Override
    public MarioState pegarPena() {
        return this;
    }
    
}

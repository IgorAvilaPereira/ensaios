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
public class MarioGrande implements MarioState {

    public MarioGrande() {
    }

    @Override
    public MarioState pegarCogumelo() {
        System.out.println("1000 pontos");
        return this;
    }

    @Override
    public MarioState levouDano() {
        return new MarioPequeno();
    }

    @Override
    public MarioState pegarPena() {
        return new MarioCapa();
    }

    @Override
    public MarioState pegarFlor() {
        return new MarioFlor();
    }
    
}

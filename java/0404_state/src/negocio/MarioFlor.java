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
public class MarioFlor implements MarioState {

    public MarioFlor() {
    }

    @Override
    public MarioState pegarCogumelo() {
        System.out.println("1000 pontos");
        return this;
    }

    @Override
    public MarioState levouDano() {
        return new MarioGrande();
    }

    @Override
    public MarioState pegarPena() {
        return new MarioCapa();
    }

    @Override
    public MarioState pegarFlor() {
        System.out.println("1000 pontos");
        return this;
    }
    
}

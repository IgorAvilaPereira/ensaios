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
        System.out.println("Permance com a pena");

        return this;
    }

    @Override
    public MarioState pegarFlor() {
        System.out.println("Está com a flor");

        return new MarioFlor();
    }

    @Override
    public MarioState pegarPena() {
        System.out.println("Permanece com a pena");

        return new MarioPena();
    }

    @Override
    public MarioState levarDano() {
        System.out.println("Perdeu a pena, ficou somente grande");
        return new MarioGrande();
    }

}

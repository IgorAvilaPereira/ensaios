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


    @Override
    public MarioState pegarCogumelo() {
        System.out.println("Permance Grande");
        return this;
    }

    @Override
    public MarioState pegarFlor() {
        System.out.println("Ficou com a Flor");
        return new MarioFlor();
    }

    @Override
    public MarioState pegarPena() {
        System.out.println("Ficou com a Pena..");
        return new MarioPena();
    }

    @Override
    public MarioState levarDano() {
        System.out.println("Ficou pequeno");
        return new MarioPequeno();
    }
    
}

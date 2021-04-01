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
public class MarioPequeno implements MarioState {

    @Override
    public MarioState pegarCogumelo() {
        System.out.println("Cresceu: Ficou grande");
        return new MarioGrande();
    }

    @Override
    public MarioState pegarFlor() {
        System.out.println("Ficou com a flor");
        return new MarioFlor();
    }

    @Override
    public MarioState pegarPena() {
        System.out.println("Ficou com a pena");
        return new MarioPena();
    }

    @Override
    public MarioState levarDano() {
        System.out.println("Morreu");
        return new MarioMorto();
    }

   
    
}

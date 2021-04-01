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
        System.out.println("It's Big Mario");
        return new MarioGrande();
    }

    @Override
    public MarioState pegarFlor() {
        System.out.println("Tô soltando fogo...");
        return new MarioFogo();
    }

    @Override
    public MarioState levarDano() {
        System.out.println("Me fudi....");
        return new MarioMorto();
    }

    @Override
    public MarioState pegarPena() {
        System.out.println("I belive I can fly...");
        return new MarioPena();
    }
    
}

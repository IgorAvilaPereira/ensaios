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
public class MarioFogo implements MarioState {

    @Override
    public MarioState pegarCogumelo() {
        return this;
    }

    @Override
    public MarioState pegarFlor() {
        return this;
    }

    @Override
    public MarioState levarDano() {
        System.out.println("Perdi o lança fogo...");
        return new MarioGrande();
    }

    @Override
    public MarioState pegarPena() {
        System.out.println("Agora posso voar");
        return new MarioPena();
    }

   
    
}

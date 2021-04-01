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
        return this;
    }

    @Override
    public MarioState pegarFlor() {
        System.out.println("Soltando fogo");
        return new MarioFogo();
    }

    @Override
    public MarioState levarDano() {
        System.out.println("Fiquei pequeno novamente...");
        return new MarioPequeno();
    }

    @Override
    public MarioState pegarPena() {
        System.out.println("Posso voar");
        return new MarioPena();
    }

    
    
}

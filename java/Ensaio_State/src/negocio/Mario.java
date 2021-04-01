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
public class Mario {
    // estado
    protected MarioState estado;   
    
    public Mario(){
        estado = new MarioPequeno();
    }
    
    public void pegarCogumelo(){
        // estadoFuturo = estadoAtual.pegarCogumelo()
        
        // Na primeira iteração 
        // estadoAtual = MarioPequeno
        // estadoFuturo = MarioGrande
        estado = estado.pegarCogumelo();
    }
    
    public void pegarFlor(){
        estado = estado.pegarFlor();
    }
    
    public void pegarPena(){
        estado = estado.pegarPena();
    }
    
    public void levarDano(){
        estado = estado.levarDano();
    }
}

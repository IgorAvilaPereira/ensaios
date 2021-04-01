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
    protected MarioState estado;
    protected boolean estrela;    
    
    public Mario(){
        this.estado = new MarioPequeno();
        this.estrela = false;
    }
    
    public void pegarEstrela(){
        this.estrela = true;                
    }    
    
    public void pegarCogumelo(){       
        estado = estado.pegarCogumelo();        
    }
    
    public void pegarPena(){
        estado = estado.pegarPena();
        
    }
    
    public void pegarFlor(){
        estado = estado.pegarFlor();
        
    }
    
    public void levarDano(){
        if (!estrela) {   
            estado = estado.levarDano();
        }        
    }
    
}

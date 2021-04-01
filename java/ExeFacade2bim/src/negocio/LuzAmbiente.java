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
public class LuzAmbiente {
    
    public void on(){
        System.out.println("Ligando Luz Ambiente");
    }
    
    public void off(){
        System.out.println("Desligando Luz Ambiente");
    }
    
    public void dim(int i){
        System.out.println("Diminuindo a luz ...em:"+i+"%");
    }
}

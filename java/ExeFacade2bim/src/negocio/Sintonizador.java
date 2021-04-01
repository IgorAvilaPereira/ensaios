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
public class Sintonizador {
    private Amplificador amplificador;
    
    public void on(){
        System.out.println("Ligando o Sintonizador...");
    }
    
    public void off(){
        System.out.println("Desligando o Sintonizador..");
    }
    
    public void setAm(){
        System.out.println("Ligando o AM");
    }
    public void setFm(){
        System.out.println("Desligando o FM");
    }
    public void setFrequency(){
        System.out.println("Frequencia...");
    }
            
    
}

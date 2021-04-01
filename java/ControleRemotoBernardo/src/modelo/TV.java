/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author bernardo.silva
 */
public class TV {
    
    private int polegadas;
    private String marca;

    public TV(int polegadas, String marca) {
        this.polegadas = polegadas;
        this.marca = marca;
    }

    public int getPolegadas() {
        return polegadas;
    }

    public void setPolegadas(int polegadas) {
        this.polegadas = polegadas;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }
    
    public void ligar(){
        System.out.println("Tv ligando no posto");
    }
    
    public void desligar(){
        System.out.println("Tv desligando no posto");
    }
    
    
    
    
    
}

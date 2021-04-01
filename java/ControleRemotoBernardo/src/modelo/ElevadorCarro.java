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
public class ElevadorCarro {
    private String modelo, marca;
    private int pesoMaximo;

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getPesoMaximo() {
        return pesoMaximo;
    }

    public void setPesoMaximo(int pesoMaximo) {
        this.pesoMaximo = pesoMaximo;
    }
    
    public void subirCarro(){
        System.out.println("Subindo o carro no posto");
    }
    public void descerCarro(){
        System.out.println("Descendo o carro no posto");
    }
    
}

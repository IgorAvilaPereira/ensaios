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
public class Kombi {
    private String acessorios;
    private double dimensoes;
    private String placa;

    public String getAcessorios() {
        return acessorios;
    }

    public void setAcessorios(String acessorios) {
        this.acessorios = acessorios;
    }

    public double getDimensoes() {
        return dimensoes;
    }

    public void setDimensoes(double dimensoes) {
        this.dimensoes = dimensoes;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }
    
    

  
    @Override
    public String toString(){
        return this.placa + "/ " + this.acessorios;
    }
    
}

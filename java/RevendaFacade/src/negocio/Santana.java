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
public class Santana {
    private boolean arCondicionado;
    private boolean rodaDeLiga;
    private String placa;

    public boolean isArCondicionado() {
        return arCondicionado;
    }

    public void setArCondicionado(boolean arCondicionado) {
        this.arCondicionado = arCondicionado;
    }

    public boolean isRodaDeLiga() {
        return rodaDeLiga;
    }

    public void setRodaDeLiga(boolean rodaDeLiga) {
        this.rodaDeLiga = rodaDeLiga;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }
  
       
    @Override
    public String toString(){
        return this.placa + "/" + this.rodaDeLiga;
    }
    
}

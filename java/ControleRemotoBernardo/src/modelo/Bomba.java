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
public class Bomba {
    private int litrosTotal;
    private String tipoCombustivel;

    public int getLitrosTotal() {
        return litrosTotal;
    }

    public void setLitrosTotal(int litrosTotal) {
        this.litrosTotal = litrosTotal;
    }

    public String getTipoCombustivel() {
        return tipoCombustivel;
    }

    public void setTipoCombustivel(String tipoCombustivel) {
        this.tipoCombustivel = tipoCombustivel;
    }
    
    public void encherTanque(){
        System.out.println("Enchendo o tanque");
    }
    
    public void parar(){
        System.out.println("Parando de encher o tanque");
    }
    
    
    
    
    
}

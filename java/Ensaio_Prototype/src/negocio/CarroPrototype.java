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
public abstract class CarroPrototype {
    
    protected double valorCompra;
    
    // methods abstract
    public abstract String exibirInfo();    
    public abstract CarroPrototype clonar();
    
    public double getValorCompra(){
        return valorCompra;
    }
    
    public void setValorCompra(double valorCompra){
        this.valorCompra = valorCompra;
    }    
}

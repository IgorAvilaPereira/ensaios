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
public class Ka extends CarroPrototype {

    protected Ka(CarroPrototype k) {
        this.valorCompra = k.getValorCompra();
    }
    
    public Ka(){
        this.valorCompra = 30000;
    }

    @Override
    public String exibirInfo() {
        return "Ford Ka R$ " + this.valorCompra;
    }

    @Override
    public CarroPrototype clonar() {
        return new Ka(this);
    }
    
}

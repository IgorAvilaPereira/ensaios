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
public class Carro extends CarroPrototype {

    protected Carro(Carro molde) {
        super.setValorCompra(molde.getValorCompra());
    }

    public Carro(){
        super.setValorCompra(0);
    }
    
    
    @Override
    public Carro clonar() {
        return new Carro(this);
    }

    @Override
    public String exibirInfo() {
        return "Palio: " + super.getValorCompra();
    }
    
}

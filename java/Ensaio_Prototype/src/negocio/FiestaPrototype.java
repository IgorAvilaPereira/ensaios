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
public class FiestaPrototype extends CarroPrototype {
   
    protected FiestaPrototype(FiestaPrototype fiestaPrototype){
        this.valorCompra = fiestaPrototype.getValorCompra();
    }
    
    public FiestaPrototype(){
        this.valorCompra = 0.0;
    }

    @Override
    public String exibirInfo() {
        return "Modelo: Fiesta\nMontadora: Ford\nValor:"+this.valorCompra;
    }

    @Override
    public CarroPrototype clonar() {
        return new FiestaPrototype(this);
    }    
}
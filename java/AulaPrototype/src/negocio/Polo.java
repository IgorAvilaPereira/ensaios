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
public class Polo extends CarroPrototype {
    
   protected Polo(Polo p){
       this.valorCompra = p.getValorCompra();
       this.ano = p.getAno();
   }
   
   public Polo(){
       this.valorCompra =  50000;
       this.ano  = 2017;
   }

    @Override
    public String exibirInfo() {
        return "Volkswagen Polo R$:"+this.valorCompra  +  "ANo:"+this.ano;
    }

    @Override
    public CarroPrototype clonar() {
        return new Polo(this);
    }
    
}

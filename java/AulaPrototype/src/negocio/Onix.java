/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author iapereira
 */
public class Onix extends CarroPrototype implements  Cloneable {

    protected Onix(Onix o) {
        this.ano =  o.getAno();
        this.valorCompra = o.getValorCompra();
    }

    public Onix(){
        this.ano = 0;
        this.valorCompra = 0;
    }
    
    @Override
    public String exibirInfo() {
        return "GM Onix R$:"+this.valorCompra + "ano:"+this.ano;    
            
    }
    
    
//    @Override
//    public Object clone(){
//        //return new Onix(this);
//        return this.clone();
//    }
//    

    @Override
    public CarroPrototype clonar() {
        try {
            return (CarroPrototype) this.clone();
            // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        } catch (CloneNotSupportedException ex) {
            Logger.getLogger(Onix.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    
}

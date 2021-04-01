/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iterador;

import esporte.CanaisEsporte;
import java.util.Iterator;

/**
 *
 * @author iapereira
 */
public class IteratorCanaisEsporte implements Iterator {
    CanaisEsporte canaisEsporte;
    int contador;
    
    
    public IteratorCanaisEsporte(){
        this.canaisEsporte = new CanaisEsporte();
        this.contador = 0;
    }

    @Override
    public boolean hasNext() {
        return this.contador < this.canaisEsporte.getNumeroDeCanais();
        
    }

    @Override
    public Object next() {
        return this.canaisEsporte.getCanais()[this.contador++];
    }
    
}

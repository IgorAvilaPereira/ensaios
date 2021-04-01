/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iterador;

import entretenimento.CanaisEntretenimento;
import esporte.CanaisEsporte;
import java.util.Iterator;

/**
 *
 * @author iapereira
 */
public class IteratorCanaisEntretenimento implements Iterator {
    CanaisEntretenimento canaisEntretenimento;
    int contador;
    
    
    public IteratorCanaisEntretenimento(){
        this.canaisEntretenimento = new CanaisEntretenimento();
        this.contador = 0;
    }

    @Override
    public boolean hasNext() {
        return this.contador < this.canaisEntretenimento.getCanais().size();
        
    }

    @Override
    public Object next() {
        return this.canaisEntretenimento.getCanais().get(this.contador++);
    }
    
}

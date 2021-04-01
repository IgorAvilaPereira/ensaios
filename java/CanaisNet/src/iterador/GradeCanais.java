/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iterador;

import canal.Canal;
import entretenimento.CanaisEntretenimento;
import esporte.CanaisEsporte;
import java.util.ArrayList;
import java.util.Iterator;
import filmes.CanaisFilmes;

/**
 *
 * @author iapereira
 */
public class GradeCanais {
    private IteratorCanaisEntretenimento iteratorCanaisEntretenimento;
    private IteratorCanaisEsporte iteratorCanaisEsporte;

    public GradeCanais(){
        this.iteratorCanaisEntretenimento = new IteratorCanaisEntretenimento();
        this.iteratorCanaisEsporte = new IteratorCanaisEsporte();
        
        
        
        
        
    }
    
    
    private void imprimeCanais(Iterator iterator){
        while(iterator.hasNext()){
            Canal canal = (Canal) iterator.next();
            //System.out.println("passou...");
            System.out.println("Canal:"+canal.getNome());
        }
    }
    
    
     public void imprimeCanais(){
       this.imprimeCanais(iteratorCanaisEsporte);
       this.imprimeCanais(iteratorCanaisEntretenimento);
    }
    
    
    
    
    
    
    
    
}

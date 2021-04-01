/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entretenimento;

import java.util.ArrayList;
import canal.Canal;
import iterador.IteratorCanaisEntretenimento;
import java.util.Iterator;

/**
 *
 * @author iapereira
 */
public final class CanaisEntretenimento {
    private ArrayList<Canal> canais;

    public CanaisEntretenimento() {
        this.canais = new ArrayList<>();
        this.addCanal("Globo", 8);
        this.addCanal("Sbt", 7);
        this.addCanal("Record", 5);
                
    }
    
    public void addCanal(String nome, int numero){
        Canal e = new Canal(nome, numero);
        this.canais.add(e);
    }
    
    

    public ArrayList<Canal> getCanais() {
        return canais;
    }

    public Iterator createIterator(){
        return new IteratorCanaisEntretenimento();
    }
    
    
  //  public void setCanais(ArrayList<Canal> canais) {
    //    this.canais = canais;
    //}
    
    
    
}

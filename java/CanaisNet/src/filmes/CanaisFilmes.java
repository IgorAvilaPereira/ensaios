package filmes;


import java.util.HashMap;
import java.util.Map;
import canal.Canal;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author iapereira
 */
public class CanaisFilmes {
    private Map canais;
    private int numeroDeCanais;
    
    public CanaisFilmes(){
        this.canais = new HashMap();
        
        this.numeroDeCanais = 1;        
        this.canais.put(numeroDeCanais, new Canal("Telecine", 69));
        
        this.numeroDeCanais++;        
        this.canais.put(this.numeroDeCanais, new Canal("TNT", 120));

    }

    public Map getCanais() {
        return canais;
    }

    public int getNumeroDeCanais() {
        return numeroDeCanais;
    }
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package esporte;

import canal.Canal;

/**
 *
 * @author iapereira
 */
public class CanaisEsporte {
    private Canal[] canais;
    private int numeroDeCanais;
    private final static int MAX = 3;
    
    public CanaisEsporte(){
        this.numeroDeCanais = 0;
        this.canais = new Canal[MAX];
        // numeroDeCanais == 0
        this.addCanal("FoxSport", 78);
        // numeroDeCanais == 1
        this.addCanal("SportTv", 39);
        // numeroDeCanais == 2
        this.addCanal("EsporteInterativo", 50);
        
        
        // a posicao 2 não tem nenhum canal alocado
        //this.canais[2] = new Canal("EsporteInterativo", 50);
        
        // Ultrapassa o tamanho maximo
        //this.canais[3] = new Canal("ESPN", 40);
                
    }
    
    public void addCanal(String nome, int numero) {
        if (this.numeroDeCanais < this.canais.length){
            this.canais[this.numeroDeCanais] = new Canal(nome,  numero);
            this.numeroDeCanais++;
        }  else {
            throw new IndexOutOfBoundsException("LOTOU..");
        }   
       
    }

    public int getNumeroDeCanais() {
        return numeroDeCanais;
    }
    
    
    
    

    public Canal[] getCanais() {
        return canais;
    }

    public void setCanais(Canal[] canais) {
        this.canais = canais;
    }

    
    
    
    
}

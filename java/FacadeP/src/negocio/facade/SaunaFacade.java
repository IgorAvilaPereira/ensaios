/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.facade;

import negocio.sauna.Cliente;
import negocio.sauna.Garota;
import negocio.sauna.Sauna;

/**
 *
 * @author iapereira
 */
public class SaunaFacade {
    private final Sauna sauna;

    public void addCliente(Cliente c){
        this.sauna.getClientes().add(c);
    }            
    
    
    public SaunaFacade(){
        this.sauna = new Sauna("Alfredo", "69/120", "sigilo");
        Garota g1 = new Garota();
        g1.setApelido("MariPalma");
        g1.setHabilidades("Sado");
        
        Garota g2 = new Garota();
        g2.setApelido("Thammy");
        g2.setHabilidades("Bi..");
        
        this.sauna.getGarotas().add(g1);
        this.sauna.getGarotas().add(g2);
        
        
        Cliente c1 = new Cliente();
        c1.setApelido("Marinha");
        c1.setFetiches("Sado");
        
        Cliente c2 = new Cliente();
        c2.setApelido("MamauDasNovinhas");
        c2.setFetiches("ninfas...");
        
        this.sauna.getClientes().add(c1);
        this.sauna.getClientes().add(c2);
        
    }
    
    public void comecaSacanagem(){
        this.sauna.comecaSacanagem();
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Fan150;
import negocio.Fusca;
import negocio.MotoAdapter;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Fusca fusca = new Fusca();
        System.out.println("Criando o Fusca...");
        fusca.quatroRodas();
        fusca.Volante();
        
        System.out.println("====================");
        
        Fan150 fan150 = new Fan150();
        //fan150.duasRodas();
        //fan150.guidao();
        
        //System.out.println("=======================");
        
        
        MotoAdapter adapter =  new MotoAdapter(fan150);
        adapter.quatroRodas();
        adapter.Volante();
        
        
        
        
    }
    
}

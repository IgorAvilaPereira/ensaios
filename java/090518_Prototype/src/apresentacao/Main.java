/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Carro;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Carro prototipo = new Carro();
        prototipo.setValorCompra(20000);
        
        Carro palio = prototipo.clonar();        
        System.out.println(palio.exibirInfo());
        palio.setValorCompra(3000);
        
        Carro palioBatidoBaseadoNoPalioAnterior = palio.clonar();
        System.out.println("");
        
        
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author iapereira
 */
public class Fusca implements Carro {

    @Override
    public void volante() {
        System.out.println("Volante de Fusca...");
    }

    @Override
    public void quatroCarro() {
        System.out.println("4 rodas aro 14");
    }
    
}

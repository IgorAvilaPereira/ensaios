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
public class Alarme implements IProtecao {

    @Override
    public void proteger() {
        System.out.println("Disparando o alarme");
        
    }
    
}

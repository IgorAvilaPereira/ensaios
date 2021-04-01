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
public class NoCommand implements Command {

    @Override
    public void btnOn() {
        System.out.println("Nada");
    }

    @Override
    public void btnOff() {
        System.out.println("Nada..");
    }

    @Override
    public void btnMiddle() {
        System.out.println("Nada...");
    }
    
}

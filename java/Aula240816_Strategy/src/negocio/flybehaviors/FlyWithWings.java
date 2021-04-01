/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.flybehaviors;

/**
 *
 * @author iapereira
 */
public class FlyWithWings implements FlyBehavior {

    @Override
    public void fly() {
        System.out.println("Voando com asas....");
    }
    
    
}

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
public class PombaRola extends Bird {

    @Override
    public void display() {
        System.out.println("Pomba Rola");
        super.performFly();
    }
    
}

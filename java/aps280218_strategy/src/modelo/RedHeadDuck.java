/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author iapereira
 */
public class RedHeadDuck extends Duck {

    @Override
    public void display() {
        System.out.println("Pato Cabeça Vermelha...");
        this.performFly();
        this.performQuack();
    }
    
}

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
public class IgorDuck extends Duck {

    @Override
    public void display() {
        System.out.println("Igor Duck");
        this.performFly();
        this.performQuack();
    }
    
}

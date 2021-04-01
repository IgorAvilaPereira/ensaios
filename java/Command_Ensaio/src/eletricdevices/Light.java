/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eletricdevices;

/**
 *
 * @author iapereira
 */
public class Light implements EletricDevice {
    
    @Override
    public void on(){
        System.out.println("Light <ON>");
    }

    @Override
    public void off(){
        System.out.println("Light <OFF>");
    }
    
}

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
public class Luz {

    private boolean status;
    
    public void liga(){
        if (this.status == false){
            System.out.println("Ligou a luz...");
            this.status = true;
        }
    }
    
    public void desliga(){
        if (this.status) {
            System.out.println("Desligou a luz...");
            this.status = false;
        }
    }
    
}

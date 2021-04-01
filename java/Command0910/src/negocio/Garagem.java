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
public class Garagem {

    private boolean aberta;
    
    public void abrir(){
        System.out.println("Abriu a garagem...");
        this.aberta = true;
    }
    
    public void fechar(){
        System.out.println("Fechando a garagem....");
        this.aberta = false;
    }
    
}

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
public class Carro {
    private boolean status;
    private int velocidade;
    
    public void ligar(){
        this.status = true;
        System.out.println("Ligando....");
    }
    
    public void desligar(){
        this.status = false;
        System.out.println("Desligando...");
    }
    
    public void ultraVelocidade(){
        System.out.println("Velocidade Ultra");
        this.velocidade = 10;
    }

    void velocidadeInicial() {
        System.out.println("Velocidade Zerada");
        this.velocidade = 0;
    }
    
}

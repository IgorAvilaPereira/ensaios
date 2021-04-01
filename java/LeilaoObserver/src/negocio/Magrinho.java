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
public class Magrinho implements Observer {
    private String nome;
    private double lance;

    public Magrinho(String nome) {
        this.nome = nome;
    }
    
    
   @Override
    public void update(Observer observer) {
        //if (entrou) {
            System.out.println(this.nome+"(O magrinho): "+ " ficou sabendo um lance vencedor realizado por:"+observer.getNome() + " o lance de :"+observer.lance());
        //} else {
          //  System.out.println(this.nome+"(O magrinho): "+ " ficou sabendo da SAIDA DE uma pessoa do consorcio:"+nomeNovoConvidado);
        //}
    }

    @Override
    public String getNome() {
        return this.nome;
    }

    @Override
    public double lance() {
        return this.lance;
    }

    @Override
    public void darLance(double lance) {
        this.lance = lance;
    }
    
    
    
}

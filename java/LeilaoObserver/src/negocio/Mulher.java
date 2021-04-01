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
public class Mulher implements Observer {
    private final String nome;
    private double lance;

    public Mulher(String nome) {
        this.nome = nome;
    }
    
    @Override
    public void update(Observer observer) {
        //if (entrou) {
            System.out.println(this.nome+": ficou sabendo que o lance de "+observer.getNome() + "eh o lance vencedor..."+observer.lance());
        ///} else {
           // System.out.println(this.nome+": Acabou de sair do consorcio: "+nomeNovoConvidado);
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

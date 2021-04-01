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
public class Participante {
    String nome;
    double lance;

    public Participante(String nome, double lance) {
        this.nome = nome;
        this.lance = lance;
    }
    
    

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getLance() {
        return lance;
    }

    public void setLance(double lance) {
        this.lance = lance;
    }
    
    
    
}

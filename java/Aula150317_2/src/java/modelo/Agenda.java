/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public class Agenda {
    private ArrayList<Pessoa> vetPessoa;

    public Agenda() {
        this.vetPessoa =  new ArrayList();
        Pessoa e = new Pessoa();
        e.setNome("Igor1");
        e.setSobrenome("Pereira1");
        this.vetPessoa.add(e);
    }
    
    

    public ArrayList<Pessoa> getVetPessoa() {
        return vetPessoa;
    }

    public void setVetPessoa(ArrayList<Pessoa> vetPessoa) {
        this.vetPessoa = vetPessoa;
    }
    
    
    
}

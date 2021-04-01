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
public class Perfil extends Pessoa {
 
    private ArrayList<Match> matches;
    
    public Perfil(){
        this.matches = new ArrayList();
    }

   
    
    
    
    public void adicionaMatch(Perfil p){
        this.matches.add(new Match(this, p));
    }

    public ArrayList<Match> getMatches() {
        return matches;
    }

    public void setMatches(ArrayList<Match> matches) {
        this.matches = matches;
    }
    
    

    

    
    public String imprimeMatches() {
        String resultado = "";
        for (int i = 0; i < matches.size(); i++) {
            Match m = matches.get(i);            
            resultado += m.imprime() + "\n";
        }
        return resultado;
    }

    @Override
    public String imprime() {
        return this.getNome();
    }
    
    
    
    
}

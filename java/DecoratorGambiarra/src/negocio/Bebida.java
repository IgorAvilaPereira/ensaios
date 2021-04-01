package negocio;


import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author iapereira
 */
public abstract class Bebida {
    protected String descricao;
    protected double custo;
    protected ArrayList<Ingrediente> vetIngrediente;

    public Bebida() {
        this.custo = 0;
        this.vetIngrediente = new ArrayList();
    }
    
    public double custo(){
        return this.custo;
    }
    
    public void addIngrediente(Ingrediente ingrediente){
        this.custo+= ingrediente.custo();
        this.vetIngrediente.add(ingrediente);        
    }
    
    public String getDescricao(){
        String d = this.descricao;
        for (int i = 0; i < vetIngrediente.size(); i++) {
            Ingrediente ingrediente = vetIngrediente.get(i);
            d += ingrediente.descricao();           
        }
        return d;
    }
    
}

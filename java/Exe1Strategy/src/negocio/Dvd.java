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
public class Dvd extends Produto {
    
    public Dvd(){
        super("Dvd", 10, new SemPromocao());
    }
    
    public Dvd(String nome, double preco, Promocao promocao){
        super(nome, preco, promocao);
    }    
    
}

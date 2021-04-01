/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

/**
 *
 * @author iapereira
 */
public class Milk implements Ingrediente {

    public Milk() {
    }

    @Override
    public String getNome() {
        return "Leite";
    }

    @Override
    public double custo() {
        return 200;
    }
    
}

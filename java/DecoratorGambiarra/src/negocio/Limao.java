package negocio;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author iapereira
 */
public class Limao implements Ingrediente {

    @Override
    public double custo() {
        return 1.0;
    }

    @Override
    public String descricao() {
        return "Limao";
    }
    
}

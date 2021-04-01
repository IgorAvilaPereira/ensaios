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
public class Pessoa implements Observer{

    @Override
    public void update(boolean taTocando) {
        System.out.println("Pessoa nao sabe o que fazer...mas o telefone ta atrapalhando...ou mudo..."+taTocando);
    }
    
}

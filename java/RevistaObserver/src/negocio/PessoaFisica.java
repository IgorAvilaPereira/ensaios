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
public class PessoaFisica implements Observer{

    @Override
    public void update(String noticia) {
        System.out.println("Pessoa física recebeu a notícia... " + noticia);  
    }
    
}

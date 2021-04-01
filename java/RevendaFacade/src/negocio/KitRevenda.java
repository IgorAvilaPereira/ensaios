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
public class KitRevenda {
    private Gol l;
    private Santana r;
    private Kombi m;
    
    public void init(){
          
        l = new Gol();
        l.setNome("Queridão");
        l.setCilindrada(1000);
        l.setAirbag(false);
        System.out.println(l.toString());
        
        r = new Santana();
        r.setPlaca("yyyyyyyy");
        r.setArCondicionado(false);
        r.setRodaDeLiga(false);
        System.out.println(r.toString());

        
        m = new Kombi();
        m.setAcessorios("Direção, ar, rádio");
        m.setDimensoes(1.6);
        m.setPlaca("xxxxxxx");
        System.out.println(m.toString());
    }

   
    
}

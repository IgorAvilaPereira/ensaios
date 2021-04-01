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
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Balada tigrao = new Balada("Tigrao");
        Convidado igor = new Apaixonado("Igor");
        tigrao.entrandoNaBalada(igor);
        Convidado bernardo = new Ciumento("Bernardo");
        tigrao.entrandoNaBalada(bernardo);
        Convidado robinson = new Gala("Robinson");
        tigrao.entrandoNaBalada(robinson);
        Convidado myreli = new Ectasy("Myreli");
        tigrao.entrandoNaBalada(myreli);
        System.out.println("====================================");
        tigrao.saindoDaBalada(bernardo);
        
    }
    
}

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
        Beverage espresso = new Espresso();
        espresso.addCondiment(new Milk());
        espresso.addCondiment(new Milk());
        System.out.println("Custo:"+espresso.totalCost());
        System.out.println("Descrição:"+espresso.getDescription());
    }
    
}

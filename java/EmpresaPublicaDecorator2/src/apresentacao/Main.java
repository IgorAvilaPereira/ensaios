/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Auxiliar;
import negocio.Cargo;
import negocio.Prefeito;

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
        Cargo a = new Auxiliar();
        a = new Prefeito(a);
        System.out.println("Descrição:\n"+a.mostraNome());
        System.out.println("Salario:"+a.calcSalario());
    }
    
}

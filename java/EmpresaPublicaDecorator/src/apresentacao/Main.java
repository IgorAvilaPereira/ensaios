/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Auxiliar;
import negocio.Cargo;
import negocio.Gerente;
import negocio.Prefeito;
import negocio.Secretario;
import negocio.Vereador;

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
        Cargo aux = new Auxiliar();
        aux = new Vereador(aux);
        System.out.println("===============");
        System.out.println("Descrição:");
        System.out.println(aux.mostraNome());
        System.out.println("=============");
        System.out.println("Salario:");
        System.out.println(aux.calcSalario());
        System.out.println("****************");
        Cargo ge = new Gerente();
        System.out.println("Salario default de um gerente:"+ge.calcSalario());
        ge = new Prefeito(ge);
        System.out.println("Gerente + Prefeito...");
        System.out.println("===============");
        System.out.println("Descrição:");
        System.out.println(ge.mostraNome());
        System.out.println("=============");
        System.out.println("Salario:");
        System.out.println(ge.calcSalario());
        ge = new Secretario(ge);
        System.out.println("Gerente + Prefeito + Secretario");
        System.out.println(ge.mostraNome());
        System.out.println(ge.calcSalario());
        
    }
    
}

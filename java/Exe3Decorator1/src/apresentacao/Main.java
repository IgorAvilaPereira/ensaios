/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Auxiliar;
import negocio.Cargo;
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
        Cargo obj = new Auxiliar();
        obj = new Vereador(obj);
        obj = new Secretario(obj);
        obj = new Prefeito(obj);
        
        System.out.println("Cargo + Incorporações:"+obj.mostraNome());
        System.out.println("Salario:"+obj.calcSalario());
    }
    
}

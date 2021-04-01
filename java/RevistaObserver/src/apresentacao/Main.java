/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Idoso;
import negocio.PessoaFisica;
import negocio.PessoaJuridica;
import negocio.Revista;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        Revista revista = new Revista();
        revista.registerObserver(Idoso.getInstance());
        revista.registerObserver(new PessoaFisica());
        revista.registerObserver(new PessoaJuridica());
        revista.registerObserver(Idoso.getInstance());
        revista.setState("Peitos da Marquezine");
    }

}

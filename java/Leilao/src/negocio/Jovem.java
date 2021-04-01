/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.List;

/**
 *
 * @author Anderson
 */
public class Jovem implements Observer {

    @Override
    public void update(double lance, String participante) {
      if (participante.equals("Jovem")) {

            System.out.println("Você (JOVEM) deu lance de " + lance + ".");

        } else {
            System.out.println("JOVEM: O " + participante + " deu lance de " + lance + ".");

        }

    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author Anderson
 */
public class Gata implements Observer {

    @Override
    public void update(double lance, String participante) {
        if (participante.equals("Gata")) {

            System.out.println("Você (Gata) deu lance de " + lance + ".");

        } else {
            System.out.println("GATA: O " + participante + " deu lance de " + lance + ".");

        }
    }

}

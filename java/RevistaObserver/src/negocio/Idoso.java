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
public class Idoso implements Observer {

    private static Idoso uniqueIdoso;

    private Idoso() {

    }

    public synchronized static Idoso getInstance() {
        if (uniqueIdoso == null) {
            uniqueIdoso = new Idoso();
        }
        return uniqueIdoso;
    }

    @Override
    public void update(String noticia) {
        System.out.println("Velho viu a noticia... " + noticia);
    }

}

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
public class ConcreteEnviadorSMS implements EnviadorSMS {

    @Override
    public void enviadorSMS(String origem, String destino, String[] msgs) throws Exception {
        System.out.println("Enviando...");
        System.out.println(origem);
        System.out.println(destino);
        for (int i = 0; i < msgs.length; i++) {
            System.out.println(msgs[i]);
        }
    }

}

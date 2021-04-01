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
public interface EnviadorSMS {
    public void enviadorSMS(String origem, String destino, String[] msgs) throws Exception;
}

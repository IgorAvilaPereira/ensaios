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
public class Veio implements Observer {

    @Override
    public void update(int stateWork) {
        System.out.println("O veio ficou sabendo que o painel modificou:...."+stateWork);
    }
    
}

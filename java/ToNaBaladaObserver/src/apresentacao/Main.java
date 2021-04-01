/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Magrinho;
import negocio.FestaConcreteSubject;
import negocio.Gordinho;
import negocio.Mulher;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        FestaConcreteSubject nyx = new FestaConcreteSubject();
        nyx.setNome("Nyx");
        nyx.setCapacidade(500);
        nyx.setArea(100);
        nyx.setPreco(10);
        
        Mulher sheilaCarvalho = new Mulher("Sheila Carvalho");
        Gordinho igor = new Gordinho("Igor");
        Magrinho havyner = new Magrinho("Havyner");
        Gordinho betito = new Gordinho("Betito");
        
        System.out.println("A Sheila Carvalho ta sozinha na festa");
        nyx.addObserver(sheilaCarvalho);
        System.out.println("=======================");
        System.out.println("O igor entrou, e a Sheila ficou sabendo...");
        nyx.addObserver(igor);
        System.out.println("=======================");
        System.out.println("O havyner, e tanto o igor como a Sheila tao sabendo...");
        nyx.addObserver(havyner);
        System.out.println("============================");
        System.out.println("Agora o havyner tb vai receber a notificacao que o betito acabou de entrar no festere...");
        nyx.addObserver(betito);
        //nyx.notifyObservers();
        
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Magrinho;
import negocio.Leiloeiro;
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
        Leiloeiro jose = new Leiloeiro();
        jose.setNome("Jose");
        
        Mulher sheilaCarvalho = new Mulher("Sheila Carvalho");
        sheilaCarvalho.darLance(1000);
        Gordinho igor = new Gordinho("Igor");
        igor.darLance(1001);
        Magrinho havyner = new Magrinho("Havyner");
        havyner.darLance(1002);
        Gordinho betito = new Gordinho("Betito");
        betito.darLance(2000);
        
        System.out.println("A Sheila Carvalho ta sozinha no consorcio");
        jose.addObserver(sheilaCarvalho);
        System.out.println("=======================");
        System.out.println("O igor entrou, e a Sheila ficou sabendo...");
        jose.addObserver(igor);
        System.out.println("=======================");
        System.out.println("O havyner, e tanto o igor como a Sheila tao sabendo...");
        jose.addObserver(havyner);
        System.out.println("============================");
        System.out.println("Agora o havyner tb vai receber a notificacao que o betito acabou de entrar no consorcio...");
        jose.addObserver(betito);
        //nyx.notifyObservers();   
        System.out.println("======================");
        //colombro.removerObserver(sheilaCarvalho);
        System.out.println("Quem eh o vencedor:"+jose.getGanhador().getNome());
        
    }
    
}

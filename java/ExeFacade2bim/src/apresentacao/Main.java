/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Amplificador;
import negocio.DvdPlayer;
import negocio.HomeTheaterFacade;
import negocio.LuzAmbiente;
import negocio.MaquinaDePipoca;
import negocio.Projetor;
import negocio.Tela;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        DvdPlayer dvdPlayer = new DvdPlayer();
        MaquinaDePipoca popper = new MaquinaDePipoca();
        LuzAmbiente lights = new LuzAmbiente();
        Tela screen =  new Tela();
        Amplificador amp = new Amplificador();
        Projetor projector = new Projetor();

        HomeTheaterFacade homeTheaterFacade = new HomeTheaterFacade(popper, lights, screen, amp, dvdPlayer, projector);
        homeTheaterFacade.watchMovie("Matrix..");
        
        System.out.println("------------------");
        
        homeTheaterFacade.endMovie();
    }
    
}

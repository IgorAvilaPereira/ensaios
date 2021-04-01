/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Gata;
import negocio.Jovem;
import negocio.Leiloeiro;
import negocio.Veio;

/**
 *
 * @author Anderson
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int r=1;
        Leiloeiro leiloeiro = new Leiloeiro();
        leiloeiro.subcribe(new Jovem());
        leiloeiro.subcribe(new Gata());
        leiloeiro.subcribe(new Veio());
        //leiloeiro.novoLance(75, "Jovem");
        //leiloeiro.novoLance(100, "Gata");
        //leiloeiro.novoLance(200, "Veio");
        while (leiloeiro.getLanceVencedor() < 1000) {
            System.out.println("=========================");
            System.out.println("Rodada...."+r);
            r++;
            leiloeiro.novoLance(3 * leiloeiro.getLanceVencedor(), "Jovem");
            leiloeiro.novoLance(10 + leiloeiro.getLanceVencedor(), "Gata");
            leiloeiro.novoLance( leiloeiro.getLanceVencedor()+ leiloeiro.getLanceVencedor()/2, "Veio");
            System.out.println("====================");
        }
        System.out.println("Vencedor:"+leiloeiro.getParticipanteVencedor());
        System.out.println("Lance Vencedor:"+leiloeiro.getLanceVencedor());
    }

}

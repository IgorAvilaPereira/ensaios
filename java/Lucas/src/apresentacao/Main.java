/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.ArrayList;
import negocio.Leiloeiro;
import negocio.Participante;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Leiloeiro leiloeiro = new Leiloeiro();
        ArrayList<Participante> vet = new ArrayList();
        //vet.add(new Participante("Igor", 1000));
        //vet.add(new Participante("Lucas", 1001));
        leiloeiro.adicionarParticipante(new Participante("Igor", 1000));
        
        //leiloeiro.getParticipantes().add(new Participante("Igor", 1000));
        //leiloeiro.getParticipantes().add(new Participante("Lucas", 1000));
    }
    
}

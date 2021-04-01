/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public class Leiloeiro {
    Participante vencedor;
    ArrayList<Participante> participantes;

    public Participante getVencedor() {
        return vencedor;
    }

    public void setVencedor(Participante vencedor) {
        this.vencedor = vencedor;
    }

    public ArrayList<Participante> getParticipantes() {
        return participantes;
    }

    public void setParticipantes(ArrayList<Participante> participantes) {
        this.participantes = participantes;
    }

    public void adicionarParticipante(Participante participante) {
        this.participantes.add(participante);
        notificar();
    }

    private void notificar() {
        for (int i = 0; i < participantes.size(); i++) {
            Participante p = participantes.get(i);
            System.out.println("Entrou um novo participante...");
            
        }
    }
    
    
    
    
    
}

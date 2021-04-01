/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public class Balada implements IBalada {
    private String nome;
    private ArrayList<Convidado> vetConvidado;

    public Balada(String nome) {
        this.nome = nome;
        this.vetConvidado = new ArrayList();
    }
    
    @Override
    public void entrandoNaBalada(Convidado convidado){
        this.vetConvidado.add(convidado);
        this.notificar(vetConvidado.size() - 1, convidado.getNome() + ":Entrando na balada...");
    }
    
    @Override
    public void saindoDaBalada(int i){
        this.notificar(i, this.vetConvidado.get(i).getNome() + ": SAINDO na balada...");
        this.vetConvidado.remove(i);

    }

        
    @Override
    public void saindoDaBalada(Convidado convidado){
        //this.vetConvidado.remove(convidado);
        int pos = this.vetConvidado.indexOf(convidado);
        this.notificar(pos, convidado.getNome() + "SAINDO na balada...");
        this.vetConvidado.remove(convidado);
    }
    
    
    @Override
    public void notificar(int pos, String mensagem){
        for (int i = 0; i < vetConvidado.size(); i++) {
            Convidado c = vetConvidado.get(i);
            if (i != pos ){
                c.notificacao(mensagem);            
            }
        }
    }

}

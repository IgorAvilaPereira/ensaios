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
public class Convidado implements Observer {
    private final String nome;
    
    public Convidado(String nome){
        this.nome =  nome;
    }

    @Override
    public void update() {
        System.out.println(this.nome + " foi notificado: Alguém Entrou ou Saiu da balada...");
    }

    @Override
    public void ocorreuAlgoComALuz(boolean comLuz) {
        if (!comLuz){
            System.out.println("A festa tem luz");
        }
        else {
            System.out.println("Festa sem luz...swinger....");
        }
    }
    
}

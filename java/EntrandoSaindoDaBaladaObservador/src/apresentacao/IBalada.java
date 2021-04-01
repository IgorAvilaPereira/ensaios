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
interface IBalada {
    public void entrandoNaBalada(Convidado convidado);
    public void saindoDaBalada(Convidado convidado);
    public void saindoDaBalada(int i);
    public void notificar(int pos, String mensagem);



    
}

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
public class BancoUsuarios {
    int quantidadeUsuarios;
    int usuariosConectados;

    public BancoUsuarios() {
        this.quantidadeUsuarios = (int) (Math.random() * 100);
        this.usuariosConectados = (int) (Math.random() * 10);
    }
    
    

    public int getQuantidadeUsuarios() {
        return quantidadeUsuarios;
    }

   // public void setQuantidadeUsuarios(int quantidadeUsuarios) {
     //   this.quantidadeUsuarios = quantidadeUsuarios;
    //}

    public int getUsuariosConectados() {
        return usuariosConectados;
    }

   // public void setUsuariosConectados(int usuariosConectados) {
     //   this.usuariosConectados = usuariosConectados;
    //}
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.BancoProxy;

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
        String login = "ricardo";
        String senha = "#safadao";
        BancoProxy bancoProxy = new BancoProxy(login, senha);
        System.out.println(bancoProxy.getNumeroDeUsuarios());
        
        login = "admin";
        senha = "admin";
        bancoProxy = new BancoProxy(login, senha);
        System.out.println(bancoProxy.getUsuariosConectados());
    }
    
}

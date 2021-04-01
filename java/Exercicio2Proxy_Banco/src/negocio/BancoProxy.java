/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author iapereira
 */
public class BancoProxy extends BancoUsuarios {

    private String login;
    private String senha;

    public BancoProxy(String login, String senha) {
        super();
        this.login = login;
        this.senha = senha;

    }

    @Override
    public String getNumeroDeUsuarios() {
        if (this.ehAutorizado()) {
            return super.getNumeroDeUsuarios();
        }
        return "SEM PERMISSAO";
    }

    @Override
    public String getUsuariosConectados() {
        if (this.ehAutorizado()) {
            return super.getUsuariosConectados();
        }
        return "SEM PERMISSAO";
    }

    public boolean ehAutorizado() {
        return login.equals("admin") && senha.equals("admin");
    }
}

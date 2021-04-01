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
public class BancoProxy extends BancoUsuarios {

    private final BancoUsuarios bancoUsuarios;
    private final String login;
    private final String senha;

    public BancoProxy(String login, String senha) {
        this.login = login;
        this.senha = senha;
        this.bancoUsuarios = new BancoUsuarios();
    }

    @Override
    public int getQuantidadeUsuarios() {
        boolean isLogado = this.login();
        if (isLogado) {
            return this.bancoUsuarios.getQuantidadeUsuarios();
        } else {
            throw new IllegalAccessError();
        }
    }

    // public void setQuantidadeUsuarios(int quantidadeUsuarios) {
    //   this.quantidadeUsuarios = quantidadeUsuarios;
    //}
    @Override
    public int getUsuariosConectados() {
        boolean isLogado = this.login();
        if (isLogado) {
            return this.bancoUsuarios.getUsuariosConectados();
        } else {
            throw new IllegalAccessError();
        }
    }

    private boolean login() {
        return "login".equals(this.login) && "senha".equals(this.senha);
    }
}

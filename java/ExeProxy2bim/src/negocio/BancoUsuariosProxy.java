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
public class BancoUsuariosProxy extends BancoUsuarios {
    private final String login;
    private final String senha;
    
    public BancoUsuariosProxy(String login, String senha){
        super();
        this.login = login;
        this.senha = senha;        
    }
    
    private boolean temPermissao(){
        return this.login.equals("tads") && this.senha.equals("tads");
    }
    
    @Override
     public String getNumeroDeUsuarios() {
        if (this.temPermissao()) return super.getNumeroDeUsuarios();
        return "NAO tem permissao";
    }

    @Override
    public String getUsuariosConectados() {
        if (this.temPermissao()) return super.getUsuariosConectados();
        return "NAO tem permissao";
    }
}

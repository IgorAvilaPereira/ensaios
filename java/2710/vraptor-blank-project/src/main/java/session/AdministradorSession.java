/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import model.Administrador;
import java.io.Serializable;
import javax.enterprise.context.SessionScoped;

/**
 *
 * @author iapereira
 */
@SessionScoped
public class AdministradorSession implements Serializable {
    
    private Administrador administrador;

    public AdministradorSession() {
        this.administrador = new Administrador();
    }

    public Administrador getAdministrador() {
        return administrador;
    }

    public void setAdministrador(Administrador administrador) {
        this.administrador = administrador;
    }
    
    
    public void destruir(){
        this.administrador = new Administrador();
    }
    
    
    
    
}

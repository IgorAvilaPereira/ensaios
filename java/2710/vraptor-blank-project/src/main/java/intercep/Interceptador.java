/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package intercep;

import br.com.caelum.vraptor.Accepts;
import br.com.caelum.vraptor.AfterCall;
import br.com.caelum.vraptor.BeforeCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import controller.ArquivoController;
import controller.IndexController;
import javax.inject.Inject;
import session.AdministradorSession;

/**
 *
 * @author iapereira
 */
@Intercepts
public class Interceptador {
    
    @Inject
    private AdministradorSession administradorSession;
    
    
    @Inject
    private Result result;
    
    
    
    
    @Accepts
    public boolean igorDecideInterceptador(ControllerMethod method){
        // false => nao intercepta
        // true => intercepta
//        System.out.println("=============================");
//        System.out.println("=============================");
//        System.out.println("=============================");
//        System.out.println(method.getController().getType().getClass().getSimpleName());
//        System.out.println("=============================");
//        System.out.println("=============================");
        
        //return false;
       return ! method.getController().getType().equals(IndexController.class);
    }
    
    
    @BeforeCall
    public void antes(){        
        if (!administradorSession.getAdministrador().isLogado()){
            result.redirectTo(IndexController.class).index();
        }
        System.out.println("===========================");
        System.out.println("===========================");
        System.out.println("===========================");
        System.out.println("ANTES....");
        
        System.out.println("===========================");
        System.out.println("===========================");
        System.out.println("===========================");
    }
    
    @AfterCall
    public void depoisIgor(){
        System.out.println("===========================");
        System.out.println("===========================");
        System.out.println("===========================");
        System.out.println("depois....");
        
        System.out.println("===========================");
        System.out.println("===========================");
        System.out.println("===========================");
        
        
    }
    
}

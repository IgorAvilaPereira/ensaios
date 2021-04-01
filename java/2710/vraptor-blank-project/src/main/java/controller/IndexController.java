package controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import model.Administrador;
import session.AdministradorSession;
import session.ChuvaSession;

@Controller
public class IndexController {
    
    
        @Inject
        private ChuvaSession chuvaSession;
        
        
        @Inject
        private AdministradorSession administradorSession;

        @Inject
	private Result result;

	@Path("/")
	public void index() {
            
                chuvaSession.setGranizo(true);
		result.include("variable", "VRaptor!"+chuvaSession.getOndeTo());
                
	}
        
        @Post
        public void login(Administrador administrador){
             if (administrador.getLogin().equals("igor") && administrador.getSenha().equals("igor")){
                 administrador.setLogado(true);
                 administradorSession.setAdministrador(administrador);
                 result.redirectTo(ArquivoController.class).listar();
             }
             else {
                 result.redirectTo(this).erro("Login com erro");
             }
        }

    public void erro(String msg) {
        result.include("mensagem", msg);
        
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public void destruir(){
        this.administradorSession.destruir();
        this.result.redirectTo(this).index();
    }
}
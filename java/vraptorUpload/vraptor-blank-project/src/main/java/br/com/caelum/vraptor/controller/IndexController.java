package br.com.caelum.vraptor.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import java.io.File;
import java.io.IOException;

@Controller
public class IndexController {

    private final Result result;

    /**
     * @deprecated CDI eyes only
     */
    protected IndexController() {
        this(null);
    }

    @Inject
    public IndexController(Result result) {
        this.result = result;
    }

    @Path("/")
    public void index() {
       
    }

    @Post
    public void upload(UploadedFile arquivo) throws IOException {
        //File arquivoFile = new File("/home/iapereira/NetBeansProjects/vraptorUpload/vraptor-blank-project/src/main/webapp/WEB-INF/arquivos/", arquivo.getFileName());
        // com outro nome
        File arquivoFile = new File("/home/iapereira/NetBeansProjects/vraptorUpload/vraptor-blank-project/src/main/webapp/WEB-INF/arquivos/", "igor.png");
        arquivo.writeTo(arquivoFile);
        result.include("variable", "ok");        
        this.result.redirectTo(this).index();
    }
    
    public void remover(){
        File arquivoFile = new File("/home/iapereira/NetBeansProjects/vraptorUpload/vraptor-blank-project/src/main/webapp/WEB-INF/arquivos/Captura de tela de 2017-10-13 16-08-41.png");       
        arquivoFile.delete();
        result.include("variable", "ok");        
        this.result.redirectTo(this).index();      
        
    }
    
    
    public File exibir() throws IOException {
        return new File("/home/iapereira/NetBeansProjects/vraptorUpload/vraptor-blank-project/src/main/webapp/WEB-INF/arquivos/igor.png");       
    }  
}

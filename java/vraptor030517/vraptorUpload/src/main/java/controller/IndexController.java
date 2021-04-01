package controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.inject.Inject;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author iapereira
 */
@Controller
public class IndexController {

    @Inject
    private Result result;
    
    @Path("/")
    public void index(){
        
    }
    
    @Post
    @Path("/index/upload")
    public void upload(UploadedFile file) throws IOException {
        if (null != file) {
            // eh preciso trocar o endereco do diretorio.
            String DIR_DOWLOAD = "/home/iapereira/NetBeansProjects/vraptor030517/vraptorUpload/src/main/webapp/WEB-INF/arquivos/";
            File f = new File(DIR_DOWLOAD + file.getFileName());
            IOUtils.copyLarge(file.getFile(), new FileOutputStream(f));
            result.include("mensagem", "Sucesso");
        } else {
            result.include("mensagem", "Fracasso");

        }
    }
}

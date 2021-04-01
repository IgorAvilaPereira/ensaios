/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import java.io.File;
import java.io.IOException;
import javax.inject.Inject;
import session.AdministradorSession;
import session.ChuvaSession;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;

@Controller
public class ArquivoController {

    @Inject
    private ChuvaSession chuvaSession;

    @Inject
    private AdministradorSession administradorSession;

    @Inject
    private Result result;

    @Get
    //@Path("/arquivo/listar")
    public void listar() {
        String pathname = "/home/iapereira/NetBeansProjects/2710/vraptor-blank-project/src/main/webapp/WEB-INF/arquivos/";
        File folder = new File(pathname);
        File[] listOfFiles = folder.listFiles();
        for (int i = 0; i < listOfFiles.length; i++) {
            if (listOfFiles[i].isFile()) {
                System.out.println("File " + listOfFiles[i].getName());
            } else if (listOfFiles[i].isDirectory()) {
                System.out.println("Directory " + listOfFiles[i].getName());
            }
        }
        result.include("vetArquivo", listOfFiles);
        //chuvaSession.setOndeTo(local);
        //result.include("zamberlan", "Admin:"+administradorSession.getAdministrador().isLogado());
        result.include("zamberlan", "");

    }

    public void tela_adicionar() {

    }

    public void upload(UploadedFile arquivo) throws IOException {
        String pathname = "/home/iapereira/NetBeansProjects/2710/vraptor-blank-project/src/main/webapp/WEB-INF/arquivos/";
        //result.include("js", "<script> alert('"+ arquivo.getContentType() + "');</script>");
        System.out.println("============================");
        System.out.println("===============================");
        System.out.println(arquivo.getContentType());
        System.out.println("============================");
        System.out.println("============================");
        if (arquivo.getContentType().trim().equals("image/png")) {
            File arq = new File(pathname, Calendar.getInstance().getTimeInMillis() + ".png");
            arquivo.writeTo(arq);
            this.result.redirectTo(this).listar();
        } else {
            result.redirectTo(IndexController.class).erro("aqui nao vai outra coisa alem de png...xabum");
        }
    }

    @Get
    @Path("/arquivo/excluir/{name}")
    public void excluir(String name) {
        String pathname = "/home/iapereira/NetBeansProjects/2710/vraptor-blank-project/src/main/webapp/WEB-INF/arquivos/"+name;
        File arq = new File(pathname);
        arq.delete();
        result.redirectTo(this).listar();

    }

    @Get
    @Path("/arquivo/visualizar/{name}")
    public File visualizar(String name) {
        String pathname = "/home/iapereira/NetBeansProjects/2710/vraptor-blank-project/src/main/webapp/WEB-INF/arquivos/"+name;
        return new File(pathname);
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author iapereira
 */
public abstract class Command {

    protected String pagina;
    protected HttpServletRequest request;
    protected HttpServletResponse response;

    public Command(String pagina, HttpServletRequest request, HttpServletResponse response) {
        this.pagina = pagina;
        this.request = request;
        this.response = response;

    }

    public final void executeCommand() {
        this.execute();
        try {
            RequestDispatcher rd = request.getRequestDispatcher(this.pagina);
            rd.include(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ListarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public abstract void execute();

}

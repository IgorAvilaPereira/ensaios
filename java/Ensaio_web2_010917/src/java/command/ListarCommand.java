/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.UsuarioDAO;

/**
 *
 * @author iapereira
 */
public class ListarCommand extends Command {

    public ListarCommand(String pagina, HttpServletRequest request, HttpServletResponse response) {
        super(pagina, request, response);
     
    }
    @Override
    public void execute() {        
        try {                    
            this.request.setAttribute("vet", new UsuarioDAO().listar());
        } catch (SQLException ex) {
            Logger.getLogger(ListarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }      
        
    }
    
}

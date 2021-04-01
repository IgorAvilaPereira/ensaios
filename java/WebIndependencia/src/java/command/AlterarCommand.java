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
import modelo.ForcaArmada;

/**
 *
 * @author iapereira
 */
public class AlterarCommand implements Command {

    public AlterarCommand() {
    }

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        ForcaArmada forcaArmada = new ForcaArmada();
                forcaArmada.setId(Integer.parseInt(request.getParameter("id")));
                forcaArmada.setEfetivo(Integer.parseInt(request.getParameter("efetivo")));
                forcaArmada.setNome(request.getParameter("nome"));
        try {
            forcaArmada.atualizar();
        } catch (SQLException ex) {
            Logger.getLogger(AlterarCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AlterarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
                //request.setAttribute("forca", forcaArmada);
                RequestDispatcher rd = request.getRequestDispatcher("./Servlet?acao=listar");
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(AlterarCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AlterarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
}

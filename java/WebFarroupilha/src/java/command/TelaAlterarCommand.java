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
public class TelaAlterarCommand implements Command {

    public TelaAlterarCommand() {
    }

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
          ForcaArmada forcaArmada = new ForcaArmada();
            forcaArmada.setId(Integer.parseInt(request.getParameter("id")));
        try {
            forcaArmada.carregar();
            request.setAttribute("forca", forcaArmada);
            RequestDispatcher rd = request.getRequestDispatcher("./tela_alterar.jsp");
            rd.forward(request, response);
        } catch (SQLException | ClassNotFoundException | ServletException | IOException ex) {
            Logger.getLogger(TelaAlterarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
            

    }
    
}

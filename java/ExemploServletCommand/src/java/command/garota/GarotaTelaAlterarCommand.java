/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command.garota;

import command.Command;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Garota;
import persistencia.GarotaDAO;

/**
 *
 * @author iapereira
 */
public class GarotaTelaAlterarCommand  implements  Command {

    @Override
    public void executa(HttpServletRequest request, HttpServletResponse response) {
    
     int id = Integer.parseInt(request.getParameter("id"));
        try {
            Garota garota = new GarotaDAO().obter(id);
            request.setAttribute("garota", garota);
            RequestDispatcher rd = request.getRequestDispatcher("/tela_alterar.jsp");
            rd.forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(GarotaExcluirCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }

    
}

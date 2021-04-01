/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import javax.servlet.RequestDispatcher;
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
        try {
                ForcaArmada forcaArmada = new ForcaArmada();
                forcaArmada.setId(Integer.parseInt(request.getParameter("id")));
                forcaArmada.carregar();
                request.setAttribute("forca", forcaArmada);
                 RequestDispatcher  rd = request.getRequestDispatcher("./tela_alterar.jsp");
                rd.forward(request, response);
        } catch (Exception e){
            System.out.println("xabumm...");
        }

    }
    
}

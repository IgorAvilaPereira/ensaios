/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import command.AdicionarCommand;
import command.AlterarCommand;
import command.ExcluirCommand;
import command.ListarCommand;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Endereco;
import modelo.ForcaArmada;

/**
 *
 * @author iapereira
 */
public class ForcaArmadaController extends Controller {
    
    
    public void tela_alterar() {
        try {
            ForcaArmada forcaArmada = new ForcaArmada();
            forcaArmada.setId(Integer.parseInt(request.getParameter("id")));
            forcaArmada.carregar();
            request.setAttribute("forca", forcaArmada);
            RequestDispatcher rd = request.getRequestDispatcher("./tela_alterar.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println("xabumm...");
        }

    }

    public void listar() {
        try {
            request.setAttribute("vetForcaArmada", ForcaArmada.listar());
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ListarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        RequestDispatcher rd = request.getRequestDispatcher("./listar.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ListarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void excluir() {

        ForcaArmada forcaArmada = new ForcaArmada();
        forcaArmada.setId(Integer.parseInt(request.getParameter("id")));
        try {
            forcaArmada.excluir();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ExcluirCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            request.setAttribute("mensagem", "Excluido com sucesso?" + forcaArmada.excluir());
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ExcluirCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        RequestDispatcher rd = request.getRequestDispatcher("./Servlet?controller=ForcaArmada&method=listar");
        try {
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ExcluirCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void alterar() {
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
        RequestDispatcher rd = request.getRequestDispatcher("./Servlet?controller=ForcaArmada&method=listar");
        try {
            rd.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(AlterarCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AlterarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void adicionar() {
        ForcaArmada forcaArmada = new ForcaArmada();
        forcaArmada.setNome(request.getParameter("nome"));
        Endereco endereco = new Endereco();
        endereco.setBairro(request.getParameter("bairro"));
        // colocar os demais...
        forcaArmada.setEndereco(endereco);        
        forcaArmada.setEfetivo(Integer.parseInt(request.getParameter("efetivo")));
        try {
            forcaArmada.adicionar();
            request.setAttribute("mensagem", "Forca Armada Adicionado com id " + forcaArmada.getId());
            RequestDispatcher rd = request.getRequestDispatcher("./pagina_mensagem.jsp");
            rd.forward(request, response);
        } catch (SQLException | ClassNotFoundException | ServletException | IOException ex) {
            Logger.getLogger(AdicionarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}

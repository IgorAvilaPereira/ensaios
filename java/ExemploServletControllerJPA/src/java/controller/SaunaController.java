/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import modelo.Sauna;
import persistencia.SaunaDAO;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author iapereira
 */
public class SaunaController extends Controller {    
     
    public void tela_alterar() throws ServletException, IOException{
        SaunaDAO saunaDAO = new SaunaDAO(emf);      
        request.setAttribute("sauna",  saunaDAO.findSauna(Integer.parseInt(request.getParameter("id"))));
        RequestDispatcher rd = request.getRequestDispatcher("/sauna/tela_alterar.jsp");
        rd.forward(request, response);
    }  
        
    public void alterar() throws ServletException, IOException, Exception {
        SaunaDAO saunaDAO = new SaunaDAO(emf);
        
        Sauna sauna =  saunaDAO.findSauna(Integer.parseInt(request.getParameter("id")));
        
      
        sauna.setNome(request.getParameter("nome"));
    
        saunaDAO.edit(sauna);
        //request.setAttribute("mensagem", "Sauna cadastrada com sucesso...");
        //RequestDispatcher rd = request.getRequestDispatcher("/mensagens.jsp");
        //rd.forward(request, response);
        this.listar();
    }
    
    public void tela_adicionar() throws ServletException, IOException {        
        RequestDispatcher rd = request.getRequestDispatcher("/sauna/tela_adicionar.jsp");
        rd.forward(request, response);        
    }  
    
    public void adicionar() throws ServletException, IOException{
        SaunaDAO saunaDAO = new SaunaDAO(emf);
        Sauna sauna =  new Sauna();
        sauna.setNome(request.getParameter("nome"));
        saunaDAO.create(sauna);
        //request.setAttribute("mensagem", "Sauna cadastrada com sucesso...");
        //RequestDispatcher rd = request.getRequestDispatcher("/mensagens.jsp");
        //rd.forward(request, response);
        this.listar();
    }
    
    public void listar() throws ServletException, IOException{
        SaunaDAO saunaDAO = new SaunaDAO(emf);      
        request.setAttribute("vetSauna",  saunaDAO.findSaunaEntities());
        RequestDispatcher rd = request.getRequestDispatcher("/sauna/listar.jsp");
        rd.forward(request, response);
    }
    
    public void excluir() throws NonexistentEntityException, ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        SaunaDAO saunaDAO = new SaunaDAO(emf);
        saunaDAO.destroy(id);
        this.listar();
        //request.setAttribute("mensagem", "Sauna excluida com sucesso...");
        //RequestDispatcher rd = request.getRequestDispatcher("/Servlet?controller=");
        //rd.forward(request, response);
        
    }
}

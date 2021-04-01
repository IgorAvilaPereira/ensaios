/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Pessoa;
import persistencia.PessoaDAO;
import persistencia.exceptions.NonexistentEntityException;
//import persistencia.PessoaDAO;

/**
 *
 * @author iapereira
 */
@WebServlet(name = "ExcluirServlet", urlPatterns = {"/ExcluirServlet"})
public class ExcluirServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws persistencia.exceptions.NonexistentEntityException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NonexistentEntityException {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PU");
//        EntityManager entityManager = emf.createEntityManager();
//        entityManager.getTransaction().begin();        
        int id = Integer.parseInt(request.getParameter("id"));
//        Pessoa pessoa = entityManager.find(Pessoa.class, id);
//        //Endereco endereco = entityManager.find(Endereco, response)
//        entityManager.remove(pessoa);
//        
//        entityManager.getTransaction().commit();      
        new PessoaDAO(emf).destroy(id);
        RequestDispatcher rd = request.getRequestDispatcher("./ListarServlet");
        rd.forward(request, response);
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ExcluirServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ExcluirServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

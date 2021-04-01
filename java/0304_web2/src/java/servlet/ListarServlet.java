/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import modelo.Trabalho;
import persistencia.PessoaDAO;
//import persistencia.PessoaDAO;

/**
 *
 * @author iapereira
 */
@WebServlet(name = "ListarServlet", urlPatterns = {"/ListarServlet"})
public class ListarServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PU");
        EntityManager entityManager = emf.createEntityManager();
//        entityManager.getTransaction().begin();
//        Trabalho trabalho = new Trabalho();
//        trabalho.setNome("Trabalho 1");
//        entityManager.persist(trabalho);
//        entityManager.getTransaction().commit();
        
        
        entityManager.getTransaction().begin();        
        List<Pessoa> vetPessoa = entityManager.createQuery("select p from Pessoa p", Pessoa.class).getResultList();
        List<Trabalho> vetTrabalho = entityManager.createQuery("select t from Trabalho t", Trabalho.class).getResultList();
        entityManager.getTransaction().commit();
        request.setAttribute("vetPessoa", vetPessoa);
        request.setAttribute("vetTrabalho", vetTrabalho);
        RequestDispatcher rd = request.getRequestDispatcher("./listar.jsp");
        rd.forward(request, response);


        
        //request.setAttribute("vetPessoa", new PessoaDAO(emf).getEntityManager().createNamedQuery("Pessoa.findBySexo", Pessoa.class).setParameter("sexo", 'M').getResultList());
        //request.setAttribute("vetPessoa", new PessoaDAO(emf).findPessoaEntities());
//        RequestDispatcher rd = request.getRequestDispatcher("./listar.jsp");
//        rd.forward(request, response);
      
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
        processRequest(request, response);
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
        processRequest(request, response);
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

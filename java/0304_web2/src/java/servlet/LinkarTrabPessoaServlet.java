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

/**
 *
 * @author iapereira
 */
@WebServlet(name = "LinkarTrabPessoaServlet", urlPatterns = {"/LinkarTrabPessoaServlet"})
public class LinkarTrabPessoaServlet extends HttpServlet {

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
        int trabalho_id = Integer.parseInt(request.getParameter("trabalho_id"));
        int pessoa_id = Integer.parseInt(request.getParameter("pessoa_id"));
        
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PU");
        EntityManager entityManager = emf.createEntityManager();
        
        // linko a pessoa no trabalho e o trabalho na pessoa
        entityManager.getTransaction().begin();        
        Pessoa pessoa = entityManager.find(Pessoa.class, pessoa_id);        
        Trabalho trabalho = entityManager.find(Trabalho.class, trabalho_id);
        pessoa.getTrabalhos().add(trabalho);
        trabalho.getFuncionarios().add(pessoa);
        entityManager.merge(pessoa);
        entityManager.merge(trabalho);
        entityManager.getTransaction().commit();
        
        // eu retorno a listagem inicial...
        entityManager.getTransaction().begin();               
        List<Pessoa> vetPessoa = entityManager.createQuery("select p from Pessoa p", Pessoa.class).getResultList();
        List<Trabalho> vetTrabalho = entityManager.createQuery("select t from Trabalho t", Trabalho.class).getResultList();
        entityManager.getTransaction().commit();
        request.setAttribute("vetPessoa", vetPessoa);
        request.setAttribute("vetTrabalho", vetTrabalho);
        RequestDispatcher rd = request.getRequestDispatcher("./listar.jsp");
        rd.forward(request, response);
        
        
//    }
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet LinkarTrabPessoaServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet LinkarTrabPessoaServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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

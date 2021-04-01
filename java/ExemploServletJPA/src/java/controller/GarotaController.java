/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import modelo.Garota;
import modelo.Sauna;
import persistencia.GarotaDAO;
import persistencia.SaunaDAO;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author iapereira
 */
public class GarotaController extends Controller {

    /*
    public void tela_alterar() {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Garota garota = new GarotaDAO().findGarota(id);
            request.setAttribute("garota", garota);
            RequestDispatcher rd = request.getRequestDispatcher("/tela_alterar.jsp");
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            //Logger.getLogger(GarotaExcluirCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listar() {
        List<Garota> vetGarota;
        try {
            vetGarota = new GarotaDAO().findGarotaEntities();
            request.setAttribute("vetGarota", vetGarota);
            RequestDispatcher rd = request.getRequestDispatcher("/listar.jsp");
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            //Logger.getLogger(GarotaListarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void excluir() throws NonexistentEntityException {

        int id = Integer.parseInt(request.getParameter("id"));
        try {
            new GarotaDAO().destroy(id);
            request.setAttribute("mensagem", "Excluido com sucesso..");
            RequestDispatcher rd = request.getRequestDispatcher("/mensagens.jsp");
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            //Logger.getLogger(GarotaExcluirCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void alterar() throws Exception {
        String apelido = request.getParameter("apelido");
        double altura = Double.parseDouble(request.getParameter("altura"));
        double bumbum = Double.parseDouble(request.getParameter("bumbum"));
        double valorPorHora = Double.parseDouble(request.getParameter("valorPorHora"));
        int id = Integer.parseInt(request.getParameter("id"));
        Garota garota = new Garota();
        garota.setId(id);
        garota.setAltura(altura);
        garota.setApelido(apelido);
        garota.setBumbum(bumbum);
        garota.setValor(valorPorHora);
        boolean resultado;
        try {
            new GarotaDAO().edit(garota);
            // if (resultado) {
            request.setAttribute("mensagem", "Garota alterada com sucesso...");
            //} else {
            // request.setAttribute("mensagem", "NAO FOI POSSIVEL alterar a GAROTA...");
            //}
            RequestDispatcher rd = request.getRequestDispatcher("/mensagens.jsp");
            rd.forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            // Logger.getLogger(GarotaAdicionarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
     */
    public void adicionar() throws Exception {
        String apelido = request.getParameter("apelido");
        double altura = Double.parseDouble(request.getParameter("altura"));
        double bumbum = Double.parseDouble(request.getParameter("bumbum"));
        double valorPorHora = Double.parseDouble(request.getParameter("valorPorHora"));
        Garota garota = new Garota();
        garota.setAltura(altura);
        garota.setApelido(apelido);
        garota.setBumbum(bumbum);
        garota.setValor(valorPorHora);

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("MeuPU");        
             
        try {
            
            SaunaDAO saunaDAO = new SaunaDAO(entityManagerFactory);
            Sauna sauna = new Sauna();
            sauna.setNome("S29");                    
            saunaDAO.create(sauna);
            //saunaDAO.getEntityManager().close();
            
                    
            GarotaDAO garotaDAO = new GarotaDAO(entityManagerFactory);
            garota.setSauna(sauna);
            garotaDAO.create(garota);
            //garotaDAO.getEntityManager().close();            
            sauna.getGarotas().add(garota);            
            
            //saunaDAO = new SaunaDAO(entityManagerFactory);
            saunaDAO.edit(sauna);            
            //saunaDAO.getEntityManager().close();
            
            request.setAttribute("mensagem", "Garota cadastrada com sucesso...");       
            RequestDispatcher rd = request.getRequestDispatcher("/mensagens.jsp");
            rd.forward(request, response);
            
        } catch (ServletException | IOException ex) {
            PrintWriter out = response.getWriter();
            out.println("deu erro");
        }

    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.List;
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
    
    public void excluir() throws NonexistentEntityException, ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        GarotaDAO garotaDAO = new GarotaDAO(emf);
        garotaDAO.destroy(id);
        this.listar();
        //request.setAttribute("mensagem", "Sauna excluida com sucesso...");
        //RequestDispatcher rd = request.getRequestDispatcher("/Servlet?controller=");
        //rd.forward(request, response);        
    }
    
    public void alterar() throws ServletException, IOException, Exception {
        GarotaDAO garotaDAO =  new GarotaDAO(emf);        

        Garota garota = garotaDAO.findGarota(Integer.parseInt(request.getParameter("id")));
        garota.setApelido(request.getParameter("apelido"));
        garota.setAltura(Double.parseDouble(request.getParameter("altura")));
        garota.setBumbum(Double.parseDouble(request.getParameter("bumbum")));
        garota.setValor(Double.parseDouble(request.getParameter("valor")));

        
        /*
        garota.setId(Integer.parseInt(request.getParameter("id")));
        garota.setApelido(request.getParameter("apelido"));
        garota.setAltura(Double.parseDouble(request.getParameter("altura")));
        garota.setBumbum(Double.parseDouble(request.getParameter("bumbum")));
        garota.setValor(Double.parseDouble(request.getParameter("valor")));
        */
        
        
        SaunaDAO saunaDAO = new SaunaDAO(emf);         
        Sauna sauna = saunaDAO.findSauna(Integer.parseInt(request.getParameter("sauna_id")));
        garota.setSaunaId(sauna);
        
        garotaDAO.edit(garota);
        
        sauna.getGarotaCollection().add(garota);
        saunaDAO.edit(sauna);         
        
        this.listar();
    }
    
    public void listar() throws ServletException, IOException{
        GarotaDAO garotaDAO = new GarotaDAO(emf);      
        request.setAttribute("vetGarota",  garotaDAO.findGarotaEntities());
        RequestDispatcher rd = request.getRequestDispatcher("/garota/listar.jsp");
        rd.forward(request, response);
    }
    
    public void tela_adicionar() throws ServletException, IOException{
        SaunaDAO saunaDAO = new SaunaDAO(emf);      
        List<Sauna> vetSauna = saunaDAO.findSaunaEntities();
        if (vetSauna.size() > 0){
            request.setAttribute("vetSauna",  saunaDAO.findSaunaEntities());
            RequestDispatcher rd = request.getRequestDispatcher("/garota/tela_adicionar.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("mensagem", "<h1> Cadastre antes uma sauna...</h1>");
            RequestDispatcher rd = request.getRequestDispatcher("/mensagens.jsp");
            rd.forward(request, response);       
        } 
    }    
    
    public void tela_alterar() throws ServletException, IOException{
        GarotaDAO garotaDAO = new GarotaDAO(emf);      
        request.setAttribute("garota",  garotaDAO.findGarota(Integer.parseInt(request.getParameter("id"))));
        SaunaDAO saunaDAO = new SaunaDAO(emf);      
        List<Sauna> vetSauna = saunaDAO.findSaunaEntities();        
        request.setAttribute("vetSauna",  saunaDAO.findSaunaEntities());
        RequestDispatcher rd = request.getRequestDispatcher("/garota/tela_alterar.jsp");
        rd.forward(request, response);
    }
    
    public void adicionar() throws Exception{
        Garota garota = new Garota();
        garota.setApelido(request.getParameter("apelido"));
        garota.setAltura(Double.parseDouble(request.getParameter("altura")));
        garota.setBumbum(Double.parseDouble(request.getParameter("bumbum")));
        garota.setValor(Double.parseDouble(request.getParameter("valor")));
        
        SaunaDAO saunaDAO = new SaunaDAO(emf);         
        Sauna sauna = saunaDAO.findSauna(Integer.parseInt(request.getParameter("sauna_id")));
        garota.setSaunaId(sauna);
        
        GarotaDAO garotaDAO =  new GarotaDAO(emf);
        garotaDAO.create(garota);
        sauna.getGarotaCollection().add(garota);
        
        saunaDAO.edit(sauna);         
        
        this.listar();
        //this.tela_adicionar();
    }       
}
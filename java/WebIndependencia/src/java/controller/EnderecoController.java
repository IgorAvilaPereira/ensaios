/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import modelo.Endereco;

/**
 *
 * @author iapereira
 */
public class EnderecoController extends Controller {
    
    public void listar() throws SQLException, ClassNotFoundException{
        try {
            this.request.setAttribute("vetEndereco", Endereco.listar());
            RequestDispatcher rd = request.getRequestDispatcher("./end_listar.jsp");
            rd.forward(request, response);
        } catch (IOException | ServletException e){
            System.out.println("Deu xabum aqui no listar de end.");
            
        }
    }   
    
    public void excluir() throws SQLException, ClassNotFoundException, ServletException, IOException{
        int end_id = Integer.parseInt(request.getParameter("id"));
        
        
        Endereco endereco = new Endereco();
        endereco.setId(end_id);
        endereco.excluir();
        
         RequestDispatcher rd = request.getRequestDispatcher("./Servlet?controller=Endereco&method=listar");
         rd.forward(request, response);
        
    }
}

package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import modelo.Garota;
import persistencia.GarotaDAO;

/**
 *
 * @author iapereira
 */
public class GarotaController extends Controller {

    public void adicionar() {
        String apelido = request.getParameter("apelido");
        double altura = Double.parseDouble(request.getParameter("altura"));
        double bumbum = Double.parseDouble(request.getParameter("bumbum"));
        double valorPorHora = Double.parseDouble(request.getParameter("valorPorHora"));
        Garota garota = new Garota();
        garota.setAltura(altura);
        garota.setApelido(apelido);
        garota.setBumbum(bumbum);
        garota.setValorPorHora(valorPorHora);
        boolean resultado;
        try {
            resultado = new GarotaDAO().adicionar(garota);
            if (resultado) {
                request.setAttribute("mensagem", "Garota cadastrada com sucesso...");
            } else {
                request.setAttribute("mensagem", "NAO FOI POSSIVEL cadastrar a GAROTA...");
            }
            RequestDispatcher rd = request.getRequestDispatcher("/mensagens.jsp");
            rd.forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            System.out.println("Erro no Adicionar");
        }
    }

    public void alterar() {
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
        garota.setValorPorHora(valorPorHora);
        boolean resultado;
        try {
            resultado = new GarotaDAO().alterar(garota);
            if (resultado) {
                request.setAttribute("mensagem", "Garota alterada com sucesso...");
            } else {
                request.setAttribute("mensagem", "NAO FOI POSSIVEL alterar a GAROTA...");
            }
            RequestDispatcher rd = request.getRequestDispatcher("/mensagens.jsp");
            rd.forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            System.out.println("Erro no Alterar");
        }
    }

    public void excluir() {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            new GarotaDAO().excluir(id);
            request.setAttribute("mensagem", "Excluido com sucesso..");
            RequestDispatcher rd = request.getRequestDispatcher("/mensagens.jsp");
            rd.forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            System.out.println("Erro no Excluir");
        }
    }

    public void listar() {
        ArrayList<Garota> vetGarota;
        try {
            vetGarota = new GarotaDAO().selecionarTodos();
            request.setAttribute("vetGarota", vetGarota);
            RequestDispatcher rd = request.getRequestDispatcher("/listar.jsp");
            rd.forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            System.out.println("Erro no Listar");
        }
    }

    
    public void tela_alterar() {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Garota garota = new GarotaDAO().obter(id);
            request.setAttribute("garota", garota);
            RequestDispatcher rd = request.getRequestDispatcher("/tela_alterar.jsp");
            rd.forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            System.out.println("Erro na tela alterar");
        }
    }
}

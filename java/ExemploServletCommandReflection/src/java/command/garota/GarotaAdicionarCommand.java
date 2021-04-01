/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command.garota;

import command.Command;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Garota;
import persistencia.GarotaDAO;

/**
 *
 * @author iapereira
 */
public class GarotaAdicionarCommand implements Command {

    @Override
    public void executa(HttpServletRequest request, HttpServletResponse response) {
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
            Logger.getLogger(GarotaAdicionarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}

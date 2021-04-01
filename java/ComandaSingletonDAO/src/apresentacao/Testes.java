/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import negocio.Garcom;
import persistencia.ConexaoPostgreSQL;
import persistencia.GarcomDAO;

/**
 *
 * @author iapereira
 */
public class Testes {
    public static void main(String[] args) throws SQLException {
        
        // teste da conexao
        //ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        //conexaoPostgreSQL.getConexao();
        
        
        // teste do create
        Garcom guiDasNovinhas = new Garcom();
        guiDasNovinhas.setNome("Guilherme");
        guiDasNovinhas.setApelido("GuiDANovinhaDONORTEALINESOGRA");       
        GarcomDAO garcomDAO = new GarcomDAO();
        garcomDAO.create(guiDasNovinhas);
        
        // teste do read
        //GarcomDAO garcomDAO2 = new GarcomDAO();
        Garcom gbroca = garcomDAO.read(1);
        System.out.println(gbroca.getNome());        
    }
    
}

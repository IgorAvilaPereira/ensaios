/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import negocio.Garcom;

/**
 *
 * @author iapereira
 */
public class Main {
    public static void main(String[] args) throws SQLException {
        
        // teste da conexao
        //ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQL();
        //conexaoPostgreSQL.getConexao();
        
        
        // teste do create
        Garcom mauricio = new Garcom();
        mauricio.setNome("MauricioDoNorte");
        mauricio.setApelido("MauricioDoNorteConcunhado");  
        mauricio.salvar();
        
        // teste do read
        Garcom gbroca = new Garcom();
        gbroca.setId(1);
        gbroca.carregar();
        System.out.println(gbroca.getNome());        
    }
    
}

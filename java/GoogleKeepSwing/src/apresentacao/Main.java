/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import java.util.ArrayList;
import modelo.Anotacao;
import persistencia.AnotacaoDAO;
import persistencia.ConexaoPostgreSQL;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        // TODO code application logic here
        AnotacaoDAO anotacaoDAO = new AnotacaoDAO();;
//        ArrayList<Anotacao> vetAnotacao = anotacaoDAO.listar();
//        for (int i = 0; i < vetAnotacao.size(); i++) {
//            Anotacao anotacao = vetAnotacao.get(i);
//            System.out.println("Titulo:"+anotacao.getTitulo());
//            
//        }
//        
//        
//        anotacaoDAO.inserir(new Anotacao("aps singleton", "aps singleton.."));

Anotacao anotacaoAlterar = new Anotacao();
anotacaoAlterar.setId(14);
anotacaoAlterar.setTitulo("tITULO");
anotacaoDAO.alterar(anotacaoAlterar);
        ConexaoPostgreSQL.close();
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import javax.swing.JOptionPane;
import modelo.Match;
import modelo.Perfil;
import modelo.Pessoa;
import persistencia.ConexaoPostgreSQL;
import persistencia.PerfilDAO;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
//        Perfil igor = new Perfil();
//        igor.setNome("Igor Pereira");
//        
//        new PerfilDAO().inserir(igor);
//        Perfil bernardo = new Perfil();
//        bernardo.setNome("Bernardo");
//        
//        Perfil yuri = new Perfil();
//        yuri.setNome("Yuri");
//        
//        igor.adicionaMatch(bernardo);
//        bernardo.adicionaMatch(igor);
//        igor.adicionaMatch(yuri);
//        yuri.adicionaMatch(igor);
        //Match primeiroMatch = new Match(i);
//        primeiroMatch.setPerfil1(igor);
//        primeiroMatch.setPerfil2(bernardo);
//        System.out.println(igor.imprimeMatches());
        //  JOptionPane.showMessageDialog(null, primeiroMatch.imprime(), "Tinder", JOptionPane.INFORMATION_MESSAGE);
            System.out.println(ConexaoPostgreSQL.HOST);
//        System.out.println(igor.getNome());
    }
    
}

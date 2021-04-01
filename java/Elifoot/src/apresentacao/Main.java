/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import negocio.Time;
import persistencia.ConexaoPostgreSQL;
import persistencia.TimeDAO;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        // dao
        Time tabajara = new Time();
        tabajara.setEndereco("casseta e planeta");
        tabajara.setNome("Tabajara");
        new TimeDAO().adicionar(tabajara);
        System.out.println("Id:"+tabajara.getId());
        
        
        // activerecord
        Time ibis = new Time();
        ibis.setEndereco("pernambuco");
        ibis.setNome("Ibis");
        ibis.adicionar();
        System.out.println("Id:"+ibis.getId());
     
        
        ArrayList<Time> vetTime = Time.listar();
        for (int i = 0; i < vetTime.size(); i++) {
            Time time = vetTime.get(i);
            System.out.println(time);
            
        }
        
        Connection conexaoPostgreSQL1 = ConexaoPostgreSQL.getInstance();
        Connection conexaoPostgreSQL2 = ConexaoPostgreSQL.getInstance();
        
        if (conexaoPostgreSQL1 == conexaoPostgreSQL2){
            System.out.println("Iguais");
            System.out.println(conexaoPostgreSQL1);
            System.out.println(conexaoPostgreSQL2);
            
            System.out.println(ibis.hashCode());
            System.out.println(tabajara.hashCode());
        }
        else{
            System.out.println("Diferentes....");
        }
    }
    
    
}

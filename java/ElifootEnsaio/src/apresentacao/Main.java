/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import negocio.Time;
import persistencia.TimeDAO;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            // TODO code application logic here
            
            TimeDAO timeDAO =  new TimeDAO();
            
            /*
            Time aabb = new Time();
            aabb.setNome("AABB Rio Grande");
            aabb.setEndereco("Trevo");
            System.out.println(aabb);            
            boolean resultado = timeDAO.adicionar(aabb);
            System.out.println("Foi??"+resultado);
            */
            
            Time vemCa = timeDAO.carregar(3);
            System.out.println(vemCa);
            
            ArrayList<Time> vetTime = timeDAO.listar();
            System.out.println("Listagem dos Times....");
            for (int i = 0; i < vetTime.size(); i++) {
                Time time = vetTime.get(i);
                System.out.println(time);               
            }
        } catch (SQLException ex) {
            System.out.println("Não foi possível listar...");
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

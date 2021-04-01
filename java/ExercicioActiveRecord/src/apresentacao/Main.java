/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.sql.SQLException;
import java.util.ArrayList;
import negocio.Usuario;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     * @throws java.sql.SQLException
     */
    public static void main(String[] args) throws SQLException {
        // TODO code application logic here
        Usuario igor = new Usuario("ederson", "negaodapica");
        System.out.println("Id antes de chamar o save:"+igor.getId());
        igor.save();
        System.out.println("Id depois de chamar o save...");
        System.out.println("Id:"+igor.getId());
        //igor.delete();
        
        ArrayList<Usuario> vet = Usuario.listarTodos();
        for (int i = 0; i < vet.size(); i++) {
            Usuario e = vet.get(i);
            System.out.println("NOme:"+e.getLogin());
            
        }
        
    }
    
}

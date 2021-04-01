/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public class ClienteDAO {

    public ClienteDAO() {
    }
    
    
    public ArrayList<Cliente> listar(){
        Cliente cliente1 = new Cliente();
        cliente1.setId(1);
        cliente1.setNome("Igor");
        
        
        Cliente cliente2 = new Cliente();
        cliente2.setId(2);
        cliente2.setNome("Igor2");
        
        ArrayList<Cliente> vet = new ArrayList();
        vet.add(cliente1);
        vet.add(cliente2);
        
        return vet;
        
    }
    
}

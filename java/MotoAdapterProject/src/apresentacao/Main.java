/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Cg125;
import negocio.MotoAdapter;

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
        
        Cg125 cg125 = new Cg125();
        
        MotoAdapter motoAdapter = new MotoAdapter(cg125);
        motoAdapter.quatroCarro();       
        motoAdapter.volante();
    }
    
}

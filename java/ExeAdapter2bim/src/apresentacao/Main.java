/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.MotoAdapter;
import negocio.cg125;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        cg125 cg125 = new cg125();
        MotoAdapter motoAdapter = new MotoAdapter(cg125);
        motoAdapter.Volante();
        motoAdapter.quatroRodas();
    }
        
}

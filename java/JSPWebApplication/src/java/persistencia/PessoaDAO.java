/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.util.ArrayList;
import modelo.Pessoa;

/**
 *
 * @author iapereira
 */
public class PessoaDAO {
    
    public ArrayList<Pessoa> listar(){
        ArrayList<Pessoa> vet = new ArrayList();
        vet.add(new Pessoa("Igor"));
        return vet;
    }
    
}

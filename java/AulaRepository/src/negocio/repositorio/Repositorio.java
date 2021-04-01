/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.repositorio;

import java.util.List;
import negocio.Pessoa;

/**
 *
 * @author iapereira
 */
public class Repositorio {   
    
    
    public String satisfazendo(String classe, List<Criterio> vetCriterio){
        String consulta = "SELECT * FROM "+classe + " WHERE TRUE AND ";
        for (int i = 0; i < vetCriterio.size(); i++) {
            Criterio criterio = vetCriterio.get(i);
            consulta+= " " + criterio.getCampo() + " " + criterio.getOperador() + " "+ criterio.getValor();
        }
        System.out.println("Consulta:"+consulta);
        return consulta;
    }
            
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author iapereira
 */
public class Empregado {
    private int id;
    private String nome;
    private List<EmpregadoProjeto> vetEmpregadoProjeto;

    public Empregado(){
        this.vetEmpregadoProjeto = new ArrayList();
    }

    public List<EmpregadoProjeto> getVetEmpregadoProjeto() {
        return vetEmpregadoProjeto;
    }

    public void setVetEmpregadoProjeto(List<EmpregadoProjeto> vetEmpregadoProjeto) {
        this.vetEmpregadoProjeto = vetEmpregadoProjeto;
    }

    
   
    
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    
    
    
}

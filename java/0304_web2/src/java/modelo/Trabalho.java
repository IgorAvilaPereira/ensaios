/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 *
 * @author iapereira
 */
@Entity
@Table(name = "trabalho")
public class Trabalho implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column
    private String nome;
    @ManyToMany(mappedBy = "trabalhos")
    private List<Pessoa> funcionarios;

    public Trabalho() {
        this.funcionarios =  new ArrayList();
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

    public List<Pessoa> getFuncionarios() {
        return funcionarios;
    }

    public void setFuncionarios(List<Pessoa> funcionarios) {
        this.funcionarios = funcionarios;
    }

   
    
    
    
    
}

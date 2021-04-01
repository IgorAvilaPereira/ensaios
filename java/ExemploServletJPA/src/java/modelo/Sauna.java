/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author iapereira
 */
@Entity
@Table(name = "sauna")
public class Sauna implements Serializable {
   
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column
    private String nome;
    
    @OneToMany (mappedBy = "sauna", cascade = CascadeType.REMOVE)
    private Collection<Garota> garotas;

    public Sauna() {
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

    public Collection<Garota> getGarotas() {
        return garotas;
    }

    public void setGarotas(Collection<Garota> garotas) {
        this.garotas = garotas;
    }

    
    
}

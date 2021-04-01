/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author iapereira
 */
@Entity
@Table(name = "sauna")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sauna.findAll", query = "SELECT s FROM Sauna s")
    , @NamedQuery(name = "Sauna.findById", query = "SELECT s FROM Sauna s WHERE s.id = :id")
    , @NamedQuery(name = "Sauna.findByNome", query = "SELECT s FROM Sauna s WHERE s.nome = :nome")})
public class Sauna implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "nome")
    private String nome;
    @OneToMany(mappedBy = "saunaId" , cascade = CascadeType.REMOVE)
    private Collection<Garota> garotaCollection;

    public Sauna() {
    }

    public Sauna(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @XmlTransient
    public Collection<Garota> getGarotaCollection() {
        return garotaCollection;
    }

    public void setGarotaCollection(Collection<Garota> garotaCollection) {
        this.garotaCollection = garotaCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sauna)) {
            return false;
        }
        Sauna other = (Sauna) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Sauna[ id=" + id + " ]";
    }
    
}

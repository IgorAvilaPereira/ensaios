/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author iapereira
 */
@Entity
@Table(name = "garota")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Garota.findAll", query = "SELECT g FROM Garota g")
    , @NamedQuery(name = "Garota.findById", query = "SELECT g FROM Garota g WHERE g.id = :id")
    , @NamedQuery(name = "Garota.findByAltura", query = "SELECT g FROM Garota g WHERE g.altura = :altura")
    , @NamedQuery(name = "Garota.findByApelido", query = "SELECT g FROM Garota g WHERE g.apelido = :apelido")
    , @NamedQuery(name = "Garota.findByBumbum", query = "SELECT g FROM Garota g WHERE g.bumbum = :bumbum")
    , @NamedQuery(name = "Garota.findByValor", query = "SELECT g FROM Garota g WHERE g.valor = :valor")})
public class Garota implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "altura")
    private Double altura;
    @Column(name = "apelido")
    private String apelido;
    @Column(name = "bumbum")
    private Double bumbum;
    @Column(name = "valor")
    private Double valor;
    @JoinColumn(name = "sauna_id", referencedColumnName = "id")
    @ManyToOne
    private Sauna saunaId;

    public Garota() {
    }

    public Garota(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getAltura() {
        return altura;
    }

    public void setAltura(Double altura) {
        this.altura = altura;
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    public Double getBumbum() {
        return bumbum;
    }

    public void setBumbum(Double bumbum) {
        this.bumbum = bumbum;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Sauna getSaunaId() {
        return saunaId;
    }

    public void setSaunaId(Sauna saunaId) {
        this.saunaId = saunaId;
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
        if (!(object instanceof Garota)) {
            return false;
        }
        Garota other = (Garota) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Garota[ id=" + id + " ]";
    }
    
}

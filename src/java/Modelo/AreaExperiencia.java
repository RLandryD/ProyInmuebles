/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author win 10
 */
@Entity
@Table(name = "area_experiencia")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AreaExperiencia.findAll", query = "SELECT a FROM AreaExperiencia a")
    , @NamedQuery(name = "AreaExperiencia.findById", query = "SELECT a FROM AreaExperiencia a WHERE a.id = :id")
    , @NamedQuery(name = "AreaExperiencia.findByNombre", query = "SELECT a FROM AreaExperiencia a WHERE a.nombre = :nombre")})
public class AreaExperiencia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;

    public AreaExperiencia() {
    }

    public AreaExperiencia(Integer id) {
        this.id = id;
    }

    public AreaExperiencia(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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
        if (!(object instanceof AreaExperiencia)) {
            return false;
        }
        AreaExperiencia other = (AreaExperiencia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelo.AreaExperiencia[ id=" + id + " ]";
    }
    
}

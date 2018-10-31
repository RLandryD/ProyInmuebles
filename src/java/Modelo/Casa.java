/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "casa")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Casa.findAll", query = "SELECT c FROM Casa c")
    , @NamedQuery(name = "Casa.findById", query = "SELECT c FROM Casa c WHERE c.id = :id")
    , @NamedQuery(name = "Casa.findByCosto", query = "SELECT c FROM Casa c WHERE c.costo = :costo")
    , @NamedQuery(name = "Casa.findByCalle", query = "SELECT c FROM Casa c WHERE c.calle = :calle")
    , @NamedQuery(name = "Casa.findByColonia", query = "SELECT c FROM Casa c WHERE c.colonia = :colonia")
    , @NamedQuery(name = "Casa.findByNumExt", query = "SELECT c FROM Casa c WHERE c.numExt = :numExt")
    , @NamedQuery(name = "Casa.findByNumInt", query = "SELECT c FROM Casa c WHERE c.numInt = :numInt")
    , @NamedQuery(name = "Casa.findByHabitaciones", query = "SELECT c FROM Casa c WHERE c.habitaciones = :habitaciones")
    , @NamedQuery(name = "Casa.findByMedidas", query = "SELECT c FROM Casa c WHERE c.medidas = :medidas")})
public class Casa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "costo")
    private BigDecimal costo;
    @Column(name = "calle")
    private String calle;
    @Column(name = "colonia")
    private String colonia;
    @Column(name = "num_ext")
    private String numExt;
    @Column(name = "num_int")
    private String numInt;
    @Column(name = "habitaciones")
    private Integer habitaciones;
    @Column(name = "medidas")
    private String medidas;

    public Casa() {
    }

    public Casa(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getCosto() {
        return costo;
    }

    public void setCosto(BigDecimal costo) {
        this.costo = costo;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getNumExt() {
        return numExt;
    }

    public void setNumExt(String numExt) {
        this.numExt = numExt;
    }

    public String getNumInt() {
        return numInt;
    }

    public void setNumInt(String numInt) {
        this.numInt = numInt;
    }

    public Integer getHabitaciones() {
        return habitaciones;
    }

    public void setHabitaciones(Integer habitaciones) {
        this.habitaciones = habitaciones;
    }

    public String getMedidas() {
        return medidas;
    }

    public void setMedidas(String medidas) {
        this.medidas = medidas;
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
        if (!(object instanceof Casa)) {
            return false;
        }
        Casa other = (Casa) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelo.Casa[ id=" + id + " ]";
    }
    
}

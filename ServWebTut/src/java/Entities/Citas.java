/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author win 10
 */
@Entity
@Table(name = "citas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Citas.findAll", query = "SELECT c FROM Citas c")
    , @NamedQuery(name = "Citas.findByIdTutorias", query = "SELECT c FROM Citas c WHERE c.idTutorias = :idTutorias")
    , @NamedQuery(name = "Citas.findByAlumno", query = "SELECT c FROM Citas c WHERE c.alumno = :alumno")
    , @NamedQuery(name = "Citas.findByAsunto", query = "SELECT c FROM Citas c WHERE c.asunto = :asunto")})
public class Citas implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_tutorias")
    private Integer idTutorias;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "alumno")
    private String alumno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "asunto")
    private String asunto;

    public Citas() {
    }

    public Citas(Integer idTutorias) {
        this.idTutorias = idTutorias;
    }

    public Citas(Integer idTutorias, String alumno, String asunto) {
        this.idTutorias = idTutorias;
        this.alumno = alumno;
        this.asunto = asunto;
    }

    public Integer getIdTutorias() {
        return idTutorias;
    }

    public void setIdTutorias(Integer idTutorias) {
        this.idTutorias = idTutorias;
    }

    public String getAlumno() {
        return alumno;
    }

    public void setAlumno(String alumno) {
        this.alumno = alumno;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTutorias != null ? idTutorias.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Citas)) {
            return false;
        }
        Citas other = (Citas) object;
        if ((this.idTutorias == null && other.idTutorias != null) || (this.idTutorias != null && !this.idTutorias.equals(other.idTutorias))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Citas[ idTutorias=" + idTutorias + " ]";
    }
    
}

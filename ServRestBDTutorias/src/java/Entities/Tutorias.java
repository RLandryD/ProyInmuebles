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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author win 10
 */
@Entity
@Table(name = "tutorias")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tutorias.findAll", query = "SELECT t FROM Tutorias t")
    , @NamedQuery(name = "Tutorias.findByIdTutorias", query = "SELECT t FROM Tutorias t WHERE t.idTutorias = :idTutorias")
    , @NamedQuery(name = "Tutorias.findByIdProfesor", query = "SELECT t FROM Tutorias t WHERE t.idProfesor = :idProfesor")
    , @NamedQuery(name = "Tutorias.findByDia", query = "SELECT t FROM Tutorias t WHERE t.dia = :dia")
    , @NamedQuery(name = "Tutorias.findByHora", query = "SELECT t FROM Tutorias t WHERE t.hora = :hora")})
public class Tutorias implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_tutorias")
    private Integer idTutorias;
    @Basic(optional = false)
    @Column(name = "id_profesor")
    private int idProfesor;
    @Basic(optional = false)
    @Column(name = "dia")
    private String dia;
    @Basic(optional = false)
    @Column(name = "hora")
    private String hora;

    public Tutorias() {
    }

    public Tutorias(Integer idTutorias) {
        this.idTutorias = idTutorias;
    }

    public Tutorias(Integer idTutorias, int idProfesor, String dia, String hora) {
        this.idTutorias = idTutorias;
        this.idProfesor = idProfesor;
        this.dia = dia;
        this.hora = hora;
    }

    public Integer getIdTutorias() {
        return idTutorias;
    }

    public void setIdTutorias(Integer idTutorias) {
        this.idTutorias = idTutorias;
    }

    public int getIdProfesor() {
        return idProfesor;
    }

    public void setIdProfesor(int idProfesor) {
        this.idProfesor = idProfesor;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
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
        if (!(object instanceof Tutorias)) {
            return false;
        }
        Tutorias other = (Tutorias) object;
        if ((this.idTutorias == null && other.idTutorias != null) || (this.idTutorias != null && !this.idTutorias.equals(other.idTutorias))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Tutorias[ idTutorias=" + idTutorias + " ]";
    }
    
}

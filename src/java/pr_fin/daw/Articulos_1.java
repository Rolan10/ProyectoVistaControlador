/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pr_fin.daw;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Roland
 */
@Entity
@Table(name = "chupa")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Articulos_1.findAll", query = "SELECT a FROM Articulos_1 a")
    , @NamedQuery(name = "Articulos_1.findById", query = "SELECT a FROM Articulos_1 a WHERE a.id = :id")
    , @NamedQuery(name = "Articulos_1.findByCategoria", query = "SELECT a FROM Articulos_1 a WHERE a.categoria = :categoria")
    , @NamedQuery(name = "Articulos_1.findByNombre", query = "SELECT a FROM Articulos_1 a WHERE a.nombre = :nombre")
    , @NamedQuery(name = "Articulos_1.findByEstado", query = "SELECT a FROM Articulos_1 a WHERE a.estado = :estado")
    , @NamedQuery(name = "Articulos_1.findByDescripcion", query = "SELECT a FROM Articulos_1 a WHERE a.descripcion = :descripcion")
    , @NamedQuery(name = "Articulos_1.findByAnno", query = "SELECT a FROM Articulos_1 a WHERE a.anno = :anno")
    , @NamedQuery(name = "Articulos_1.findByPrecio", query = "SELECT a FROM Articulos_1 a WHERE a.precio = :precio")})
public class Articulos_1 implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "CATEGORIA")
    private String categoria;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "NOMBRE")
    private String nombre;
    @Size(max = 60)
    @Column(name = "ESTADO")
    private String estado;
    @Size(max = 60)
    @Column(name = "DESCRIPCION")
    private String descripcion;
    @Column(name = "ANNO")
    private Integer anno;
    @Column(name = "PRECIO")
    private Integer precio;


    public Articulos_1() {
    }

    public Articulos_1(Integer id) {
        this.id = id;
    }

    public Articulos_1(Integer id, String categoria, String nombre) {
        this.id = id;
        this.categoria = categoria;
        this.nombre = nombre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getAnno() {
        return anno;
    }

    public void setAnno(Integer anno) {
        this.anno = anno;
    }

    public Integer getPrecio() {
        return precio;
    }

    public void setPrecio(Integer precio) {
        this.precio = precio;
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
        if (!(object instanceof Articulos)) {
            return false;
        }
        Articulos_1 other = (Articulos_1) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "pr_fin.daw.a[ id=" + id + " ]";
    }

}

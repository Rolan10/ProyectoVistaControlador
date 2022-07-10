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
@Table(name = "ARTICULOS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Articulos.findAll", query = "SELECT a FROM Articulos a")
    , @NamedQuery(name = "Articulos.findById", query = "SELECT a FROM Articulos a WHERE a.id = :id")
    , @NamedQuery(name = "Articulos.findByCategoria", query = "SELECT a FROM Articulos a WHERE a.categoria = :categoria")
    , @NamedQuery(name = "Articulos.findByNombre", query = "SELECT a FROM Articulos a WHERE a.nombre = :nombre")
    , @NamedQuery(name = "Articulos.findByEstado", query = "SELECT a FROM Articulos a WHERE a.estado = :estado")
    , @NamedQuery(name = "Articulos.findByDescripcion", query = "SELECT a FROM Articulos a WHERE a.descripcion = :descripcion")
    , @NamedQuery(name = "Articulos.findByAnno", query = "SELECT a FROM Articulos a WHERE a.anno = :anno")
    , @NamedQuery(name = "Articulos.findByPrecio", query = "SELECT a FROM Articulos a WHERE a.precio = :precio")})
public class Articulos implements Serializable {

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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idArticulo")
    private Collection<Comentarios> comentariosCollection;
    @JoinColumn(name = "ID_USER", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Usuarios idUser;

    public Articulos() {
    }

    public Articulos(Integer id) {
        this.id = id;
    }

    public Articulos(Integer id, String categoria, String nombre) {
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

    @XmlTransient
    public Collection<Comentarios> getComentariosCollection() {
        return comentariosCollection;
    }

    public void setComentariosCollection(Collection<Comentarios> comentariosCollection) {
        this.comentariosCollection = comentariosCollection;
    }

    public Usuarios getIdUser() {
        return idUser;
    }

    public void setIdUser(Usuarios idUser) {
        this.idUser = idUser;
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
        Articulos other = (Articulos) object;
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

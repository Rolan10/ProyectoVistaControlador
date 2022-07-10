/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pr_fin.daw;

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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Roland
 */
@Entity
@Table(name = "COMENTARIOS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comentarios.findAll", query = "SELECT c FROM Comentarios c")
    , @NamedQuery(name = "Comentarios.findById", query = "SELECT c FROM Comentarios c WHERE c.id = :id")
    , @NamedQuery(name = "Comentarios.findByComentario", query = "SELECT c FROM Comentarios c WHERE c.comentario = :comentario")
    , @NamedQuery(name = "Comentarios.findByArticulo", query = "SELECT u, c FROM Comentarios c JOIN c.idUser u JOIN c.idArticulo a WHERE a.id = :id")
    , @NamedQuery(name = "Comentarios.findByIdArticulo", query = "SELECT c FROM Comentarios c WHERE c.idArticulo = :id")
    , @NamedQuery(name = "Comentarios.findByTipo", query = "SELECT c FROM Comentarios c WHERE c.tipo = :tipo")
    , @NamedQuery(name = "Comentarios.findByTipoID", query = "SELECT c FROM Comentarios c  WHERE c.tipo= :tipo AND c.idArticulo = :idart")
    , @NamedQuery(name = "Comentarios.findByTipoUser", query = "SELECT c FROM Comentarios c WHERE c.tipo= :tipo AND c.idUser = :iduser AND c.idArticulo = :idart")})
public class Comentarios implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 60)
    @Column(name = "COMENTARIO")
    private String comentario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "TIPO")
    private String tipo;
    @JoinColumn(name = "ID_ARTICULO", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Articulos idArticulo;
    @JoinColumn(name = "ID_USER", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Usuarios idUser;

    public Comentarios() {
    }

    public Comentarios(Integer id) {
        this.id = id;
    }

    public Comentarios(Integer id, String tipo) {
        this.id = id;
        this.tipo = tipo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Articulos getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(Articulos idArticulo) {
        this.idArticulo = idArticulo;
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
        if (!(object instanceof Comentarios)) {
            return false;
        }
        Comentarios other = (Comentarios) object;
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

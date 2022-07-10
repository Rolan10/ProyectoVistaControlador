/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pr_fin.daw;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.xml.ws.spi.http.HttpContext;

/**
 *
 * @author Roland
 */
@WebServlet(name = "Controlar", urlPatterns = {"/Controlar/*"})
@MultipartConfig()
public class Controlar extends HttpServlet {

    @PersistenceContext(unitName = "PracticasPersistenciaU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;
    private TypedQuery<Articulos> query;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion;
        accion = request.getPathInfo();
        String vista = "";
        HttpSession session = request.getSession();

        List<Articulos> lr;
        String msg = "";
        String idf;
        String log;
        List<Articulos> lid;
        List<Comentarios> lcom;
        List<Usuarios> lus;
        Articulos a;
        Comentarios c;

        switch (accion) {

            case "/home":
                vista = "/index.jsp";
                break;
            case "/logout":
                session.invalidate();
                request.setAttribute("msg", "Usuario desconectado");
                vista = "/index.jsp";
                break;
            case "/articulos":
                query = em.createNamedQuery("Articulos.findAll", Articulos.class);
                lr = query.getResultList();
                request.setAttribute("articulos", lr);
                vista = "/Articulos.jsp";
                break;
            case "/crearArticulo":
                vista = "/publicarArticulos.jsp";
                break;
            case "/guardarArticulo":

                String anio = request.getParameter("anio");
                String estado = request.getParameter("st");
                String categoria = request.getParameter("cat");
                String descripcion = request.getParameter("desc");
                String nombreAr = request.getParameter("na");
                String precio = request.getParameter("pre");

                Part filePart = request.getPart("imagenform");

                try {
                    Articulos Ar = new Articulos();
                    Ar.setCategoria(categoria);
                    Ar.setDescripcion(descripcion);
                    Ar.setNombre(nombreAr);
                    Ar.setEstado(estado);
                    Ar.setPrecio(Integer.parseInt(precio));
                    Ar.setAnno(Integer.parseInt(anio));
                    Object id = session.getAttribute("id");

                    if (id != null) {
                        TypedQuery<Usuarios> query2 = em.createNamedQuery("Usuarios.findById", Usuarios.class);
                        query2.setParameter("id", id);
                        List<Usuarios> lu = query2.getResultList();

                        Ar.setIdUser(lu.get(0));

                        persist(Ar);

                        if (filePart != null) {

                            String nombre = filePart.getName();
                            Long tamano = filePart.getSize();
                            String file = filePart.getSubmittedFileName();

                            String relativePathFolder = "img";
                            String absolutePathFolder = getServletContext().getRealPath(relativePathFolder);

                            File folder = new File(absolutePathFolder);
                            if (folder.exists()) {
                                //System.err.println("Error : " + absolutePathFolder + " existe");
                            } else {
                                folder.mkdir();
                            }

                            System.out.println(absolutePathFolder + File.separator + Ar.getId() + ".jpg");
                            File f = new File(absolutePathFolder + File.separator + Ar.getId() + ".jpg");

                            //String nfp = f.getAbsolutePath();
                            OutputStream p = new FileOutputStream(f);
                            InputStream filecontent;
                            filecontent = filePart.getInputStream();
                            System.out.println("Tam: " + filePart.getSize());

                            int read = 0;
                            final byte[] bytes = new byte[1024];
                            while ((read = filecontent.read(bytes)) != -1) {
                                p.write(bytes, 0, read);
                            }

                            p.close();
                            filecontent.close();
                            System.out.println("Articulo guardado");
                            request.setAttribute("msg", "Articulo guardado");
                        }
                    }
                } catch (Exception e) {
                    System.out.println(e);
                    System.out.println("Articulo no creado");
                    request.setAttribute("msg", "ERROR: Articulo NO creado");
                }
                vista = "/Controlar/articulos";
                break;
            case "/addFavorito":
                idf = request.getParameter("id");
                if (idf != null) {
                    query = em.createNamedQuery("Articulos.findById", Articulos.class);
                    query.setParameter("id", Integer.parseInt(idf));
                    lr = query.getResultList();
                    if (lr != null) { // Esta el artículo
                        lid = (List<Articulos>) session.getAttribute("lart");
                        if (lid == null) {
                            lid = new ArrayList<>();
                        }
                        a = lr.get(0);
                        lid.add(a);
                        msg = "<p class=\"ok\">Artículo registrado en favoritos.<p>";
                        System.out.println("OK");
                        session.setAttribute("lart", lid);
                    } else { //No está el art
                        msg = "<p class=\"ok\">ERROR: Artículo registrado en favoritos. No existía.<p>";
                        System.out.println("no existia");
                    }
                } else { // Id no enviado
                    msg = "<p class=\"error\">Artículo No registrado en favoritos. Falta Id.<p>";
                    System.out.println("falta id");
                }

                request.setAttribute("msg", msg);
                query = em.createNamedQuery("Articulos.findAll", Articulos.class);
                lr = query.getResultList();
                request.setAttribute("articulos", lr);

                vista = "/Articulos.jsp";
                break;
            case "/delFavorito":
                idf = request.getParameter("id");
                int i = Integer.parseInt(idf);
                lid = (List<Articulos>) session.getAttribute("lart");
                lid.remove(i);
                session.setAttribute("lart", lid);
                vista = "/favoritos.jsp";
                break;
            case "/favoritos":

                vista = "/favoritos.jsp";
                break;
            case "/invalidar":
                session.invalidate();
                vista = "/favoritos.jsp";
                break;
            case "/detalles":

                idf = request.getParameter("id");
                query = em.createNamedQuery("Articulos.findById", Articulos.class);
                query.setParameter("id", Integer.parseInt(idf));
                lr = query.getResultList();
                a = lr.get(0);
                request.setAttribute("articulo", a);
                Object iduser = session.getAttribute("id");
                Usuarios user1 = null;
                if (iduser != null) {
                    TypedQuery<Usuarios> query2 = em.createNamedQuery("Usuarios.findById", Usuarios.class);
                    query2.setParameter("id", iduser);
                    List<Usuarios> lu = query2.getResultList();
                    user1 = lu.get(0);
                }

                TypedQuery<Comentarios> query1 = em.createNamedQuery("Comentarios.findByTipoID", Comentarios.class); //Cargamos los publicos...
                query1.setParameter("idart", a);
                query1.setParameter("tipo", "Publico");

                lcom = query1.getResultList();
                //Ahora comprabaremos si este usuario tiene comentarios tipo Vendedor o tipo Privado para añadirlos a la lista y mostrarlos...
                query1 = em.createNamedQuery("Comentarios.findByTipoUser", Comentarios.class);
                query1.setParameter("iduser", user1);
                query1.setParameter("idart", a);
                query1.setParameter("tipo", "Privado");
                List<Comentarios> lcomAux;
                lcomAux = query1.getResultList();

                //añadimos a la de comentarios publicos
                for (Comentarios y : lcomAux) {
                    lcom.add(y);
                }
                //Buscamos los nuestros de tipo vendedor
                query1 = em.createNamedQuery("Comentarios.findByTipoUser", Comentarios.class);
                query1.setParameter("iduser", user1);
                query1.setParameter("idart", a);
                query1.setParameter("tipo", "Vendedor");

                lcomAux = query1.getResultList();
                for (Comentarios y : lcomAux) {
                    lcom.add(y);
                }
                request.setAttribute("comentarios", lcom);
                vista = "/detalles.jsp";
                break;

            case "/comentar":

                idf = request.getParameter("idarticulo");

                query = em.createNamedQuery("Articulos.findById", Articulos.class);
                query.setParameter("id", Integer.parseInt(idf));
                lr = query.getResultList();
                a = lr.get(0);
                request.setAttribute("articulo", a);

                String coment = request.getParameter("comen");
                String Tip = request.getParameter("comenSelect");

                Comentarios co = new Comentarios();
                co.setComentario(coment);
                co.setTipo(Tip);
                co.setIdArticulo(a);
                Object id = session.getAttribute("id");

                if (id != null) {
                    TypedQuery<Usuarios> query2 = em.createNamedQuery("Usuarios.findById", Usuarios.class);
                    query2.setParameter("id", id);
                    List<Usuarios> lu = query2.getResultList();

                    co.setIdUser(lu.get(0));
                    persist(co);
                    System.out.println("Comen guardado");
                }
                vista = "/Controlar/detalles?id=" + idf;
                break;
            case "/categorias":
                vista = "/categorias.jsp";
                break;
            case "/filtro":
                String cat = request.getParameter("categoria");

                System.out.println(cat);
                query = em.createNamedQuery("Articulos.findByCategoria", Articulos.class);
                query.setParameter("categoria", cat);
                lr = query.getResultList();
                request.setAttribute("articulos", lr);

                vista = "/Articulos.jsp";
                break;
            case "/validar":  //comprobar datos introducidos para saber si se registro.
                try {
                    String user = request.getParameter("user");
                    String pass = request.getParameter("pass");
                    MessageDigest md = MessageDigest.getInstance("MD5");
                    md.update(pass.getBytes());
                    byte[] digest = md.digest();
                    StringBuilder sb = new StringBuilder();
                    for (byte b : digest) {
                        sb.append(String.format("%02x", b & 0xff));
                    }
                    String pass_digest = sb.toString();
                    TypedQuery<Usuarios> query = em.createNamedQuery("Usuarios.findByNameAndPass", Usuarios.class);
                    query.setParameter("name", user);
                    query.setParameter("pwd", pass_digest);

                    List<Usuarios> lu;
                    lu = query.getResultList();
                    if (!lu.isEmpty()) {
                        Usuarios u = lu.get(0);
                        session.setAttribute("id", u.getId());
                        session.setAttribute("user", u.getNick());
                        session.setAttribute("user", u.getNombre());
                        session.setAttribute("log", "true");
                        request.setAttribute("msg", user);
                    } else {
                        request.setAttribute("msg", "Usuario o Password incorrecto.");
                    }

                } catch (Exception ex) {
                    System.err.println(ex);
                    request.setAttribute("msg", "Error : imposible validar al usuario.");
                }
                vista = "/index.jsp";
                break;
            case "/guardar":
                // Guardar datos de usuario
                // UNDO: Verificación de los datos

                String correo = request.getParameter("mail");
                String contrasenia = request.getParameter("rpass");
                String nombre = request.getParameter("name");
                String direccion = request.getParameter("dir");
                String cp = request.getParameter("cp");
                String provincia = request.getParameter("provincia");
                String facebook = request.getParameter("facebook");
                String telefono = request.getParameter("telef");

                TypedQuery<Usuarios> query = em.createNamedQuery("Usuarios.findByNick", Usuarios.class);//buscamos si el correo ya existia en la bd ...
                query.setParameter("nick", correo);
                List<Usuarios> lu;
                lu = query.getResultList();

                if (lu.isEmpty()) { //si no esta el correo en la bd lo metemos.
                    try {

                        MessageDigest md = MessageDigest.getInstance("MD5");
                        md.update(contrasenia.getBytes());
                        byte[] digest = md.digest();
                        StringBuilder sb = new StringBuilder();
                        for (byte b : digest) {
                            sb.append(String.format("%02x", b & 0xff));
                        }
                        String pass_digest = sb.toString();

                        Usuarios u = new Usuarios();
                        u.setNick(correo);
                        u.setNombre(nombre);
                        u.setCodigoPostal(cp);
                        u.setTelefono(telefono);
                        u.setDireccion(direccion);
                        u.setFacebook(facebook);
                        u.setProvincia(provincia);
                        u.setPass(pass_digest);

                        persist(u);
                        System.out.println("usuario guardado");
                        request.setAttribute("msg", "Usuario guardado");
                    } catch (Exception e) {
                        System.out.println(e);
                        System.out.println("usuario no guardado");
                        request.setAttribute("msg", "ERROR: Usuario NO guardado");
                    }
                } else {
                    System.out.println("usuario no guardado,mail ya existe");
                    request.setAttribute("msg", "ERROR: Usuario NO guardado, mail ya existente");
                }
                vista = "/index.jsp";
                break;
            default:
                vista = "/index.jsp";
                break;
        }

        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void persist(Object object) {
        try {
            utx.begin();
            em.persist(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }

}

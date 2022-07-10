<%-- 
    Document   : detalles
    Created on : 15-ene-2020, 19:42:26
    Author     : Roland
--%>

<%@page import="java.util.List"%>
<%@page import="pr_fin.daw.Comentarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Detalles de: ${requestScope["articulo"].nombre}</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel ="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" crossorigin="anonymous">
        <link href="/Practicas/custom.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <!--Header-->
        <header class="masthead">

            <div> 
                <% if (session.getAttribute("log") == "true") {%>
                <form action="/Practicas/Controlar/logout" method="POST" class="d-flex flex-row-reverse font-weight-light"><!--Está logeado-->
                    <div class="p-2">                  </div>
                    <div class="p-2">                  </div>
                    <div class="p-2"><input type="submit" method="POST" value="Desconexion"></a> </div>
                </form>
                <%}%>  

                <% if (session.getAttribute("log") != "true") {%>

                <form action="/Practicas/Controlar/validar" method="POST" class="d-flex flex-row-reverse font-weight-light"><!--Log in-->
                    <div class="p-2"><input type="submit" value="Enviar"></div>
                    <div class="p-2"><input type="password" name="pass"></div>
                    <div class="p-2"><input type="text" name="user"></div>
                </form>
                <div class="d-flex flex-row-reverse font-weight-light">                                                     <!-- boton registro-->
                    <div class="p-2">                  </div>
                    <div class="p-2">                  </div>
                    <div class="p-2"><a href="/Practicas/Formulario.jsp">Registrame</a></div>
                </div>
                <%}%>
            </div>

            <div class="container h-100">
                <div class="row h-50 align-items-center">
                    <div class="col-12 text-center" >

                        <h1 class="font-weight-light">LANDO's</h1>


                    </div>

                </div>
            </div>
        </header> 
        <nav></nav> 
        <div class="col-12  bg-light"><br>
            <h2 class=" text-center font-weight-light "> Detalles del Articulo </h2>

        </div> <br>
        <div>${msg}</div>
        <div class="container">
            <div class="row ">
                <div class="col-2 align-items-center">
                    <img class="d-block  w-100 img-fluid" src="/Practicas/img/${requestScope["articulo"].id}.jpg"/>
                </div>
                <div class="col-6 ">

                    <p>Id: ${requestScope["articulo"].id}</p>
                    <p>Año: ${requestScope["articulo"].anno}</p>
                    <p>Nombre: ${requestScope["articulo"].nombre}</p>
                    <p>precio: ${requestScope["articulo"].precio}</p>
                    <p>Estado: ${requestScope["articulo"].estado}</p> 
                    <p>Categoria: ${requestScope["articulo"].categoria}</p>
                    <p>Descripcion: ${requestScope["articulo"].descripcion}</p>

                </div>
                <div class="col-4">
                    <% if (session.getAttribute("log") == "true") {%>

                    <form Action="/Practicas/Controlar/comentar" method="POST" class=" font-weight-light ">
                        <label>¿Quieres comentar acerca de este articulo?</label><br>
                        <textarea class="form-control" rows="3" id="comen" maxlength="120" name="comen" required></textarea><br>
                        <label>Este comentario se mostrara a:</label>
                        <input type="hidden" name="idarticulo" value="${requestScope["articulo"].id}" />
                        <select name="comenSelect" id="comenSelect">
                            <option  value="Publico">Publico</option>
                            <option  value="Vendedor">Vendedor</option>
                            <option  value="Privado">Privado</option>
                        </select>
                        <input type="submit"  value="¡Comentar!">
                    </form>
                    <%}%>
                    <% if (session.getAttribute("log") != "true") { %>
                    <p>¡Para poder realizar un comentario debes inciar sesión!</p>

                    <%}%>
                </div>
            </div>
        </div>
        <div class="row h-30 bg-light"><br><br></div>
        <!--CARGAR COMENTARIOS-->
        <div class="bg-light">
            <div class="container">
                <div class=" row">

                    <div class="col-6">
                        <%
                            List<Comentarios> lc = (List<Comentarios>) request.getAttribute("comentarios");
                            if (lc.size() > 0) {
                                for (Comentarios c : lc) {
                                    if (c.getTipo().equals("Privado")) {
                                        out.println("<p>Mensaje Privado </p>");
                                    }
                                    else if(c.getTipo().equals("Vendedor")){
                                    out.println("<p>Mensaje para Vendedor </p>");
                                    }
                                    out.println("<p>"+ c.getIdUser().getNombre()+": </p>");
                                    out.println("<input class='form-control' type='text' placeholder='" + c.getComentario() + "' readonly><br>");
                        %><br><%}

                            } else {
                                out.println("<p>No Hay Comentarios aun</p><br>");
                            }%>

                    </div>
                            <div class="col-6">
                               
                            </div>
                </div>

            </div>
        </div>
        <!-- Footer -->
        <footer id="sticky-footer" class="py-4 bg-dark text-white-50 ">


            <div class="container ">

                <!-- Grid row-->
                <div class="row justify-content-center align-items-center "> <!--Centramos elementos del footer siempre en el row-->

                    <!-- Grid column -->
                    <div>
                        <div>

                            <!-- Facebook -->
                            <a class="fb-ic" href="https://facebook.com">
                                <i class="fab fa-facebook-f fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                            </a>
                            <!-- Twitter -->
                            <a class="tw-ic" href="https://twitter.com">
                                <i class="fab fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                            </a>
                            <!-- Google +-->
                            <a class="gplus-ic" href="https://www.gmail.com">
                                <i class="fab fa-google-plus-g fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                            </a>

                            <!--Instagram-->
                            <a class="ins-ic" href="https://instagram.com">
                                <i class="fab fa-instagram fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                            </a>

                        </div>
                    </div>
                    <!-- Grid column -->

                </div>
                <!-- Grid row-->

            </div>
            <!-- Footer Elements -->

            <!-- Copyright -->
            <div class="footer-copyright text-center py-3">© 2020 Copyright:
                <a href=""> LANDO's</a>
            </div>
            <!-- Copyright -->

        </footer>
        <script type="text/javascript" src="/Practicas/FUNC1.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"  crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>
    </body>
</html>

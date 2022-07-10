<%-- 
    Document   : Articulos
    Created on : 09-ene-2020, 21:09:38
    Author     : Roland
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="pr_fin.daw.Articulos"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Articulos</title>
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
            <h2 class=" text-center font-weight-light "> Articulos </h2>

        </div> <br>
        <div class="container ">
            <div class="row text-center">
                <% if (session.getAttribute("log") == "true") {%>
                <div class="col-6">
                <h3><a href="/Practicas/favoritos.jsp">Favoritos</a></h3>
                </div>
                <div class="col-6">
                <h3><a href="/Practicas/publicarArticulos.jsp">Publicar</a></h3>
                </div>
                <%}%>
            </div>
        </div>
        <div class="container ">
            <div class="row">


                <%
                    List<Articulos> lr = (List<Articulos>) request.getAttribute("articulos");
                    if (lr.size() > 0) { %> 
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Precio</th>
                            <th scope="col" colspan="2">Acciones</th>
                        </tr>
                    </thead>
                    <tbody> 

                        <%
                            int i = 0;
                            for (Articulos r : lr) {

                                out.println("<tr>");
                                out.println("<th scope=\"row\">" + i + "</th>");
                                out.println("<td>" + r.getNombre() + "</td>");
                                out.println("<td>" + r.getPrecio() + "</td>");
                                out.println("<td><a href='/Practicas/Controlar/detalles?id=" + r.getId() + "'>Detalles</a></td>");

                                if (session.getAttribute("log") == "true") {
                                    out.println("<td><a href='/Practicas/Controlar/addFavorito?id=" + r.getId() + "'>Favoritos</a></td>");
                                }

                                out.println("</tr>");
                                i++;
                            }%>
                    </tbody>
                </table>
                <% } else {
                        out.println("<p>No hay Articulos</p>");
                    }
                %>
            </div>
        </div><br><br>
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

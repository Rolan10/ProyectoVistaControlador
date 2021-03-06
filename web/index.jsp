<%-- 
    Document   : index
    Created on : 09-ene-2020, 18:04:35
    Author     : Roland
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel ="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" crossorigin="anonymous">
        <link href="/Practicas/custom.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <header class="masthead">

            <div> 
                <% if (session.getAttribute("log") == "true") {%>
                <form action="/Practicas/Controlar/logout" method="POST" class="d-flex flex-row-reverse font-weight-light"><!--Está logeado-->
                    <div class="p-2">                  </div>
                    <div class="p-2">                  </div>
                    <div class="p-2"><input type="submit" value="Desconexion"></div>
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
                        <p class="lead">Compra-Venta de articulos</p>

                    </div>

                </div>
            </div>
        </header> 
        <nav></nav>

        <div class="col-12  bg-light">

            <h2 class=" text-center font-weight-light "> 
                <% if (session.getAttribute("log") == "true") {%>
                Hola <%=session.getAttribute("user")%> 
                <%}%>
                <% if (session.getAttribute("log") != "true") {%>
                Bienvenido a nuestra pagina web.
                <%}%>
            </h2>

        </div> 
        <!--Container slider + +-->
        <div class=" bg-light ">
            <div class="row align-items-center ">
                 <div class="col-3 bg-light text-center d-none d-sm-none d-md-none d-lg-block d-xl-block" >
                    <% if (session.getAttribute("log") == "true") {%>
                    <h3 class="font-weight-light">¿Quieres comenzar a publicar articulos?</h3><br>
                    <a href="/Practicas/Controlar/crearArticulo">¡Comenzar!</a>
                    <%}%>
                    <%if (session.getAttribute("log") != "true") {%>
                    <!--crear articulos en jsp ya que se tienen que logear-->
                    <h5>¡Para poder comenzar a publicar articulos debes estar registrado!</h5>
                    <a href = '/Practicas/Controlar/validar'>¡Registrate Ahora!</a>
                    <%}%>
                </div>
                
                <!--Slider-->
                 <div id="slider" class="carousel slide col-lg-6 col-xl-6 col-sm-12- col-md-12 col-d-12" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slider" data-slide-to="0" class="active"></li>
                        <li data-target="#slider" data-slide-to="1"></li>
                        <li data-target="#slider" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100 img-fluid " style="max-height: 500px" src="/Practicas/img/slider1.jpg" alt="First slide">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Lando's</h5>
                                <p>Tu pagina web de compra-venta de confianza</p>
                            </div>
                        </div>
                        
                        <div class="carousel-item ">
                            <img class="d-block w-100 img-fluid " style=" max-height: 500px" src="/Practicas/img/slider2.jpg" alt="Second slide">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Trato personalizado</h5>
                                <p>Cualquier problema puede reportarse a nuestro departamento de atencion al cliente abierto 24/7</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 img-fluid " style=" max-height: 500px" src="/Practicas/img/slider3.jpg" alt="Third slide">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Tu regalo ideal</h5>
                                <p>Comienza ya buscando tu regalo ideal</p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#slider" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#slider" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>


                <div class="col-3 bg-light  text-center d-none d-sm-none d-md-none d-lg-block d-xl-block">
                   
                    <h3 class="font-weight-light" >Contactanos:</h3><br><br>

                    <p>Correo Electronico: <a href="https://www.gmail.com">contacto@landos.com</a></p><br>
                    <p>Teléfono: <a>333-222-111</a></p><br>
                    <p>Si lo desea tambien disponemos una sección de feedback:</p><a href="">Ayudanos a mejorar</a>

                </div>
            </div>
        </div>

        <div class="col-12 d-lg-none d-xl-none w-100">
            <div class="row">
                
                <div class="col-6 text-center bg-light" ><br>
                    
                    <% if (session.getAttribute("log") == "true") {%>
                    <h5 class="font-weight-light">¿Quieres comenzar a publicar articulos?</h5>
                    <a href="/Practicas/Controlar/crearArticulo">¡Comenzar!</a>
                    <%}%>
                    <%if (session.getAttribute("log") != "true") {%>
                    <h3 class="font-weight-light" >Registro</h3> 
                     <p>Para contar con acceso a todas las funcionalidades: <a href = '/Practicas/Controlar/validar'>¡Registrate Ahora!</a></p>
                   <%}%>
            </div>
                <div class="col-6 text-center bg-light ">
                    <br>
                     <h3 class="font-weight-light" >Contactanos:</h3>

                    <p>Correo Electronico: <a href="https://www.gmail.com">contacto@landos.com</a></p>
                    <p>Teléfono: <a>333-222-111</a></p>
                    

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

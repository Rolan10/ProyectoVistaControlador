<%-- 
    Document   : publicarArticulos
    Created on : 12-ene-2020, 13:45:55
    Author     : Roland
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Publicar Articulos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel ="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" crossorigin="anonymous">
        <link href="/Practicas/custom.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <header class="masthead">



            <div class="container h-100">
                <div class="row align-items-center">
                    <div class="  col-12 text-center" > <!--falta responsive--> 
                        <br>
                        <h1 id="titulo_form">Publicar Articulo</h1><br>

                    </div>

                </div>
            </div>
        </header>
        <nav></nav>



        <section id="seccion_form" class="bg-light">
            <br>
            <Form method="POST" action="/Practicas/Controlar/guardarArticulo" enctype="multipart/form-data" >
                <div class="container w-100">
                    <div class="row align-items-center">
                        <div class="col-6 text-center">
                            <label for ="na">Nombre: </label>
                            <input type="text" id ="na" name="na" required><br><br>

                            <label for ="anio">Año:  </label>
                            <input type="number" id="anio" name="anio" required><br><br>

                            <label for ="pre"> Precio(€): </label>
                            <input type="number" id="pre" name="pre" required><br><br>
                            <label for="st">Estado:</label>
                            <select id="st" name = "st" required>
                                <option selected value="0"> Elige una opción </option>
                                <option value="Nuevo"> Nuevo </option>
                                <option value="Seminuevo"> Seminuevo</option>
                                <option value="Bastante Desgastado"> Bastante Desgastado </option>
                                <option value="Defectuoso"> Defectuoso </option>
                            </select> <br><br>

                            <label for ="cat"> Categoria: </label>
                            <select id="cat" name = "cat" required>
                                <option selected value="0"> Elige una opción </option>
                                <option value="Electronica"> Electrónica  </option>
                                <option value="Lectura"> Lectura</option>
                                <option value="Juegos y otros"> Juegos y otros </option>

                            </select> <br><br>


                        </div>
                        <div class="col-6 text-center">
                            <input class="w-100" type="file" name="imagenform" required/><br><br>   
                            <label for ="des">Descripcion</label><br>
                            <textarea class="form-control" rows="3" id="desc" maxlength="100" name="desc"></textarea>
                        </div>

                    </div>
                    <div class="row">
                        <div class=" col text-center">
                            <input type="submit" value="Crear Articulo" class="btn btn-success">
                            <br><br><br>
                        </div>
                    </div>
                </div>
            </Form>
        </section>


        <!--footer-->
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
        <script src="/Practicas/Formulario.js" type="text/javascript"></script>

    </body>
</html>

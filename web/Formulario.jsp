<%-- 
    Document   : Formulario.jsp
    Created on : 09-ene-2020, 18:45:37
    Author     : Roland
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel ="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" crossorigin="anonymous">
        <link href="custom.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <header class="masthead">



            <div class="container h-100">
                <div class="row align-items-center">
                    <div class="  col-12 text-center" >  
                        <br>
                        <h1 id="titulo_form">Registro</h1><br>
                        <p id="registro1" class="lead"> ¿Por que registrarse? 
        Registrando nos ayudas a poder conocer sus gustos 
         para de esta forma mostrarte ofertas hechas a tu medida!</p>

                    </div>

                </div>
            </div>
        </header>
        <nav></nav>



        <section id="seccion_form" class="bg-light">
            <br>
            <Form id="registro_form" mehtod="POST" action="/Practicas/Controlar/guardar" onsubmit="return validar();">
                <div class="container">
                    <div class="row align-items-center" >
                        <div class="col-6 text-center">
                            <label for ="em">Email: </label>
                            <input type="text" id ="em" name="mail" required><br><br>

                            <label for ="pass1">Clave:  </label>
                            <input type="password" id="pass1" name="pass" required><br><br>

                            <label for ="rpass1"> Repetir clave: </label>
                            <input type="password" id="rpass1" name="rpass" required><br><br>

                            <label for ="na"> Nombre: </label>
                            <input type="text" id="na" name="name" required><br><br>

                            <label for ="dir">Direccion: </label>
                            <input type="text" id="dir" name="dir" ><br><br>

                            <label for ="cp1"> Codigo Postal: </label>
                            <input type="text" id="cp1" name="cp" ><br><br>

                            <label for="pr" >Provincia</label>
                            <select id="id_ciudad" name = "provincia">

                            </select> <br><br>
                        </div>
                        <div class="col-6 text-center">
                            <label for ="fb">Facebook: </label>
                            <input type="url" id="fb" name="facebook"><br><br>

                            <label for ="tlf">Telefono: </label>
                            <input type="tel" id="tlf" name="telef"><br><br>

                            <label>Categorias de Interes</label><br>
                            <input type="checkbox" id="check1" name="elec">
                            <label for ="check1">Electronica</label>

                            <input type="checkbox" id="check2" name="Lectura">
                            <label for ="check2">Lectura</label>

                            <input type="checkbox" id="check3" name="juegos">
                            <label for ="check3">Juegos y otros</label><br><br>


                            <label>Como conociste</label><br>
                            <input type="radio" id="r" name="Radio">
                            <label for="r">Buscador</label>

                            <input type="radio" id="r1" name="Radio">
                            <label for="r1">Amigo</label>

                            <input type="radio" id="r2" name="Radio">
                            <label for ="r2"> Radio</label>

                            <input type="radio" id="r3" name="Radio">
                            <label for ="r3"> TV </label><br><br><br><br>

                        </div>

                    </div>
                    <div class="row">
                        <div class=" col text-center">
                            <button type="submit" class="btn btn-success">Registrarse</button>
                            <br><br><br>
                        </div>
                    </div>
                </div>
            </Form>
        </section>



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
        <script type="text/javascript" src="FUNC1.js"></script>
        <script src="Formulario.js" type="text/javascript"></script>
        <script>
                function validar() {
                    var  clave2, clave;
                    
                    clave2 = document.getElementById("rpass1");
                    
                    
                    clave = document.getElementById("pass1");
                    

                    if (clave.value !== clave2.value) {
                            alert("las contraseñas deben ser iguales");
                            return false;
                        
            }
        </script>
    </body>
</html>
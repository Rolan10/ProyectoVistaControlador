/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 *//*
  
  
  
  <nav class="ba">
  
  <ul class="menu">
  
  <li><a href="index.html">Inicio  </a></li> 
  <li><a href="Categorias.html">Categorias  </a></li> 
  <li><a href="Articulos.html">Articulos  </a></li> 
  <li><a href="Formulario.html">Formulario  </a> </li> 
  
  </ul>
  
  </nav>*/
var menu = [
    {name: "Inicio", url: "/Practicas/index.jsp", options: []},
    {name: "Categorias", url: "/Practicas/Controlar/categorias"},
    {name: "Articulos", url: "/Practicas/Controlar/articulos", options: []}

];
var menuHTML = '<ul class="menu">';
for (var i in menu) {
    menuHTML += "<li><a href='" + menu[i].url + "'>" + menu[i].name + "</a>";
    menuHTML += "</li>";
}
menuHTML += "</ul>";
var nav = document.getElementsByTagName("nav")[0];
nav.innerHTML = menuHTML;

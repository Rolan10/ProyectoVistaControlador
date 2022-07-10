Array_provincias = new Array("Álava", "Albacete", "Alicante", "Almería", "Ávila",
        "Badajoz", "Baleares", "Barcelona", "Burgos", "Cáceres", "Cádiz", "Castellón",
        "Ciudad Real", "Córdoba", "Coruña", "Cuenca", "Girona", "Granada", "Guadalajara",
        "Guipúzcoa", "Huelva", "Huesca", "Jaén", "León", "Lleida", "Rioja", "Lugo",
        "Madrid", "Málaga", "Murcia", "Navarra", "Orense", "Asturias", "Palencia", "Las Palmas",
        "Pontevedra", "Salamanca", "Tenerife", "Cantabria", "Segovia", "Sevilla",
        "Soria", "Tarragona", "Teruel", "Toledo", "Valencia", "Valladolid", "Vizcaya",
        "Zamora", "Zaragoza", "Ceuta", "Melilla");

var select = document.getElementById('id_ciudad');

for (var i in Array_provincias) {
    var opt = document.createElement('option');
    opt.value = i;
    opt.innerHTML = Array_provincias[i];
    select.appendChild(opt);
}

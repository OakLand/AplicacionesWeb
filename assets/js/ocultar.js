$(document).ready(function () {
    var elemento = $("#myID").val();
    if (elemento == 1) {
        $(".Conectado").show();
        $(".Promotor").hide();
        $(".Comprador").show();
        $(".Admin").hide();
        $(".Desconectado").hide();
    } else if (elemento == 2) {
        $(".Conectado").show();
        $(".Promotor").show();
        $(".Comprador").hide();
        $(".Admin").hide();
        $(".Desconectado").hide();
    } else if (elemento == 3) {
        $(".Conectado").show();
        $(".Promotor").hide();
        $(".Comprador").hide();
        $(".Admin").show();
        $(".Desconectado").hide();
    } else {
        $(".Conectado").hide();
        $(".Promotor").hide();
        $(".Comprador").hide();
        $(".Admin").hide();
        $(".Desconectado").show();
    }
});


function leerCookie(nombre) {
    var lista = document.cookie.split(";");
    var miCookie = "";
    for (i in lista) {
        var busca = lista[i].search(nombre);
        if (busca > -1) {
            miCookie = lista[i];
        }
    }
    var igual = miCookie.indexOf(nombre + "=");
    var valor = miCookie.substring(nombre.length + igual + 1);
    var fin = valor.indexOf("&");
    if (fin > 0)
        valor = valor.substring(0, fin);
    return valor;
}
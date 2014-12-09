window.onload = function () {
    var elemento = document.getElementById("myID");
    var noVisibles;
    var visibles;

    noVisibles = document.getElementsByClassName("Conectado");
    for (var val = 0; val < noVisibles.length; val++) {
        noVisibles[val].style.display = 'none';
    }
    noVisibles = document.getElementsByClassName("Promotor");
    for (var val = 0; val < noVisibles.length; val++) {
        noVisibles[val].style.display = 'none';
    }
    noVisibles = document.getElementsByClassName("Comprador");
    for (var val = 0; val < noVisibles.length; val++) {
        noVisibles[val].style.display = 'none';
    }
    noVisibles = document.getElementsByClassName("Desconectado");
    for (var val = 0; val < noVisibles.length; val++) {
        noVisibles[val].style.display = 'none';
    }
    
    if (elemento.value == "1") {
        visibles = document.getElementsByClassName("Conectado");
        for (var val = 0; val < visibles.length; val++) {
            visibles[val].style.removeProperty('display');
        }
        visibles = document.getElementsByClassName("Comprador");
    } else if (elemento.value == "2") {
        visibles = document.getElementsByClassName("Conectado");
        for (var val = 0; val < visibles.length; val++) {
            visibles[val].style.removeProperty('display');
        }
        visibles = document.getElementsByClassName("Promotor");
    } else {
        visibles = document.getElementsByClassName("Desconectado");
    }
    
    for (var val = 0; val < visibles.length; val++) {
        visibles[val].style.removeProperty('display');
    }
}

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
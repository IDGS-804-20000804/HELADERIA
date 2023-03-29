var empleado=null;//Una variable local para obtener datos del empleado
                  //que ha iniciado sesion

function inicializarPagina(){
    //Traemo la cadena JSON del Empleado de la sesion y la convertimos
    //en un Objeto JSON
    empleado= JSON.parse(sessionStorage.getItem('empleado'));
    
    //Obtenemos el nombre del empleado y ponemos en la parte correspondiente
    $('#spanNombreEmpleado').html(empleado.persona.nombre+' '+empleado.persona.apellidoPaterno+' '+empleado.persona.apellidoMaterno);
    
    
}

function cargarModuloProducto() {
    $.ajax({
            context : document.body,
            url     : "gestion/producto/producto.html"
            }).done(function(data){
                                    $('#contenedorPrincipal').html(data);
                                    });
}


function cargarModuloCliente() {
    $.ajax({
            context : document.body,
            url     : "gestion/cliente/cliente.html"
            }).done(function(data){
                                    $('#contenedorPrincipal').html(data);
                                    });
}


function cargarModuloEmpleado() {
    $.ajax({
            context : document.body,
            url     : "gestion/empleado/empleado.html"
            }).done(function(data){
                                    $('#contenedorPrincipal').html(data);
                                    });
}    


function cargarModuloSucursal() {
    $.ajax({
            context : document.body,
            url     : "gestion/sucursal/sucursal.html"
            }).done(function(data){
                                    $('#contenedorPrincipal').html(data);
                                    });
}


function cargarModuloSala() {
    $.ajax({
            context : document.body,
            url     : "gestion/sala/sala.html"
            }).done(function(data){
                                    $('#contenedorPrincipal').html(data);
                                    });
}


function cargarModuloHorario() {
    $.ajax({
            context : document.body,
            url     : "gestion/horario/horario.html"
            }).done(function(data){
                                    $('#contenedorPrincipal').html(data);
                                    });
}


function cargarModuloTratamiento() {
    $.ajax({
            context : document.body,
            url     : "gestion/tratamiento/tratamiento.html"
            }).done(function(data){
                                    $('#contenedorPrincipal').html(data);
                                    });
}


function cargarModuloReservacion() {
    $.ajax({
            context : document.body,
            url     : "gestion/reservacion/reservacion.html"
            }).done(function(data){
                                    $('#contenedorPrincipal').html(data);
                                    });
}


function cargarModuloServicio() {
    $.ajax({
            context : document.body,
            url     : "gestion/servicio/servicio.html"
            }).done(function(data){
                                    $('#contenedorPrincipal').html(data);
                                    });
}


function cerrarModulo() {
    $('#contenedorPrincipal').html('');
}

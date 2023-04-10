function inicializarModulo() {
    $('#detalleClienteEditar').modal('show'); // abrir
    $('#detalleClienteEditar').modal({backdrop: 'static', keyboard: false})
    
}

// function precio(){
//     var precio=$('#precio').value()
//     alert(precio)
//     if(precio=="0MXM" || precio=="0.00MXM"){
//         Swal.fire('Datos de Compra', 'No has seleccionado ningun producto', 'info');
//     }
// }
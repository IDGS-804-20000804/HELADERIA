function inicializarModulo() {
    //Modales de Clientes al modificar
    $('#detalleClienteEditar').modal('show'); // abrir
    $('#detalleClienteEditar').modal({backdrop: 'static', keyboard: false})

    //Modales de Materia Prima al modificar
    $('#detallemateriaPrimaModificar').modal('show'); // abrir
    $('#detallemateriaPrimaModificar').modal({backdrop: 'static', keyboard: false})
    
     //Modales de Recetas
     $('#detalleRecetaModificar').modal('show'); // abrir
     $('#detalleRecetaModificar').modal({backdrop: 'static', keyboard: false})

      //Modales de Provedor
      $('#detalleProveedorModificar').modal('show'); // abrir
      $('#detalleProveedorModificar').modal({backdrop: 'static', keyboard: false})
}

// function precio(){
//     var precio=$('#precio').value()
//     alert(precio)
//     if(precio=="0MXM" || precio=="0.00MXM"){
//         Swal.fire('Datos de Compra', 'No has seleccionado ningun producto', 'info');
//     }
// }
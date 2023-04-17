function inicializarModulo() {
     //Modales de Empleados al modificar
     $('#detalleEmpleadoModificar').modal('show'); // abrir
     $('#alertaEliminar').modal('show'); // abrir
     $('#alertaEliminar').modal({backdrop: 'static', keyboard: false})
     $('#detalleEmpleadoModificar').modal({backdrop: 'static', keyboard: false})


    //Modales de Clientes al modificar
    $('#detalleClienteEditar').modal('show'); // abrir
    $('#detalleClienteEditar').modal({backdrop: 'static', keyboard: false})
    $('#alertaEliminarCliente').modal('show'); // abrir
    $('#alertaEliminarCliente').modal({backdrop: 'static', keyboard: false})

    //Modales de Materia Prima al modificar
    $('#detallemateriaPrimaModificar').modal('show'); // abrir
    $('#detallemateriaPrimaModificar').modal({backdrop: 'static', keyboard: false})
    $('#alertaEliminarMateriaP').modal('show'); // abrir
    $('#alertaEliminarMateriaP').modal({backdrop: 'static', keyboard: false})
    
     //Modales de Recetas
     $('#detalleRecetaModificar').modal('show'); // abrir
     $('#detalleRecetaModificar').modal({backdrop: 'static', keyboard: false})

      //Modales de Provedor
      $('#detalleProveedorModificar').modal('show'); // abrir
      $('#detalleProveedorModificar').modal({backdrop: 'static', keyboard: false})

      
}

function clientes(){
    $('#detalleCliente').modal('show'); // abrir
}

function roles(){
    var arr = [];

    $("input:checkbox[name=check]:checked").each(function(){
    arr.push($(this).val());
});

console.log(arr);
alert(arr)
sessionStorage.setItem('rol',arr)

}
// function eliminarEmpleado(id) {
//     var eliminarEmpleadoUrl = '{{ url_for(empleados.eliminar_empleado_ajax)}}';
//         Swal.fire({
//         title: '¿Estás seguro de eliminar el cliente?',
//         text: 'No podrás revertir esto.',
//         icon: 'warning',
//         showCancelButton: true,
//         confirmButtonColor: '#3085d6',
//         cancelButtonColor: '#d33',
//         confirmButtonText: 'Sí, eliminar',
//         cancelButtonText: 'Cancelar'
//     }).then((result) => {
//         if (result.isConfirmed) {
//             $.ajax({
//                 type: 'POST',
//                 url: eliminarEmpleadoUrl,
//                 data: {'id': id},
//                 success: function(data) {
//                     if (data.status === 'OK') {
//                         Swal.fire({
//                             title: 'Empleado eliminado',
//                             icon: 'success'
//                         }).then((result) => {
//                             window.location.reload();
//                         });
//                     } else {
//                         Swal.fire({
//                             title: 'Error al eliminar empleado',
//                             text: data.message,
//                             icon: 'error'
//                         });
//                     }
//                 },
//                 error: function(xhr, status, error) {
//                     Swal.fire({
//                         title: 'Error al eliminar empleado',
//                         text: 'Ha ocurrido un error al intentar eliminar al empleado.',
//                         icon: 'error'
//                     });
//                 }
//             });
//         }
//     });
// }


//Elimnar empleados

// function precio(){
//     var precio=$('#precio').value()
//     alert(precio)
//     if(precio=="0MXM" || precio=="0.00MXM"){
//         Swal.fire('Datos de Compra', 'No has seleccionado ningun producto', 'info');
//     }
// }
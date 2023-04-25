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
     $('#alertaEliminarReceta').modal('show'); // abrir
     $('#alertaEliminarReceta').modal({backdrop: 'static', keyboard: false})

      //Modales de Provedor
      $('#detalleProveedorModificar').modal('show'); // abrir
      $('#detalleProveedorModificar').modal({backdrop: 'static', keyboard: false})
      $('#alertaEliminarProvedor').modal('show'); // abrir
      $('#alertaEliminarProvedor').modal({backdrop: 'static', keyboard: false})

      //Modales de Provedor
      $('#alertaEnvio').modal('show'); // abrir
      $('#alertaEnvio').modal({backdrop: 'static', keyboard: false})
      
}

function abrirModal(){
    $('#detalleReceta').modal('show');

    //Modales de Ventas
    $('#alertaCompra').modal('show'); // abrir
    $('#alertaCompra').modal({backdrop: 'static', keyboard: false})
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

function ocultarCompra(){
    $('#detalleCompra').modal('hiden'); // cerrar
    $('#alertaCompra').modal('show'); // abrir
}

function mostrarCompra(){
    $('#alertaCompra').modal('hiden'); // cerrar
    $('#detalleCompra').modal('show'); // abrir
}

function ocultarMetodoPago(){
    $('#detalleCompra').modal('hiden'); // cerrar
    $('#mensajeCompra').modal('show'); // abrir
}

const cardName = document.getElementById('card-name');
    const cardNumber = document.getElementById('card-number');
    const cardExpMonth = document.getElementById('card-exp-month');
    const cardExpYear = document.getElementById('card-exp-year');
    const cardCvv = document.getElementById('card-cvv');
    const comprarBtn = document.getElementById('btn-comprar');
    const cerrarBtn = document.getElementById('btn-cerrar');

    cardName.addEventListener('change', validarFormulario);
    cardNumber.addEventListener('change', validarFormulario);
    cardExpMonth.addEventListener('change', validarFormulario);
    cardExpYear.addEventListener('change', validarFormulario);
    cardCvv.addEventListener('change', validarFormulario); 

    function validarFormulario() {
        if (cardName.value.length >= 3 && cardName.value.length <= 30 && 
            cardNumber.value.length <= 16 && 
            cardExpMonth.value >= 1 && cardExpMonth.value <= 12 &&
            cardExpYear.value.length === 4 && cardExpYear.value >= 2023 &&
            cardCvv.value.length === 3 &&
            cardName.value !== '' && cardNumber.value !== '' && cardExpMonth.value !== '' &&
            cardExpYear.value !== '' && cardCvv.value !== '') {
            comprarBtn.removeAttribute('disabled');
            cerrarBtn.removeAttribute('disabled');
        } else {
            comprarBtn.setAttribute('disabled', true);
            cerrarBtn.setAttribute('disabled', true);
        }
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
function inicializarModulo() {
    //Modales de Clientes al modificar
    $('#detalleClienteEditar').modal('show'); // abrir

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
// function precio(){
//     var precio=$('#precio').value()
//     alert(precio)
//     if(precio=="0MXM" || precio=="0.00MXM"){
//         Swal.fire('Datos de Compra', 'No has seleccionado ningun producto', 'info');
//     }
// }
from flask import Blueprint, render_template, request, redirect, url_for
from models.clientes.clientes import Clientes
from controllers.cliente.cliente_Controllers import obtener_clientes

clientes = Blueprint('clientes', __name__)


@clientes.route('/clientes', methods=["POST", "GET"])
def cliente():
     if request.method == 'POST':
        # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
        create_form = Clientes(request.form)
        nombre = create_form.nombre.data
        apaterno = create_form.apaterno.data
        amaterno = create_form.amaterno.data
        telefono = create_form.telefono.data
        codigo_postal = create_form.codigo_postal.data
        numero_exterior = create_form.numero_exterior.data
        numero_interior = create_form.numero_interior.data
        calle = create_form.calle.data
        colonia = create_form.colonia.data
        correo = create_form.correo.data
        contrasenia = create_form.contrasenia.data
        rol = create_form.rol.data
        id_Cliente=''
        id_Usuario=''
        id_Persona=''
        # Lógica para insertar empleado en la base de datos
     #    realizar_insercion(nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, numero_exterior, calle, colonia, correo, contrasenia, rol,id_Empleado,id_Usuario,id_Persona)
        # De cualquier modo, y si todo fue bien, redireccionar
        return redirect(url_for('empleados.empleado'))
     else:
        create_form = Clientes()
        emp = obtener_clientes()
        print(emp)
        return render_template('clientes.html',form=create_form, clientes=emp)


from flask import Blueprint, render_template, request, redirect, url_for
from models.compra.compra_Forms import compra
from controllers.controllerEmpleado import obtener_empleados
from controllers.compra.compra_Controllers import obtener_compras, insertar_compra
from controllers.proveedor.proveedor_Controllers import obtener_proveedor, insertar_provedor
from controllers.materiaPrima.materiaPrima_Controllers import obtener_materia_prima
import json
import ast


compras = Blueprint('compras', __name__)

@compras.route('/compras')
def compraM():
     emp = obtener_compras()
     create_form = compra(request.form)
     provedor=obtener_proveedor()
     empleado=obtener_empleados()
     return render_template('compras.html',form=create_form, provedor=provedor, empleado=empleado,compras=emp)



@compras.route('/insertar_compra', methods=['GET', 'POST'])
@login_required
def compraGuardar():
     provedor=obtener_proveedor()
     empleado=obtener_empleados()
     if request.method == 'POST':
        create_form = compra(request.form)
        provedor=obtener_proveedor()
        empleado=obtener_empleados()
        materiaPrima=obtener_materia_prima()
        empleados = request.form.get('empleado', None)
        provedores = request.form.get('provedor', None)
        arr_receta=nombres
        arr=guardar_en_arreglo(arr_receta)
        arreglo=quitar_prefijo(arr)
        a=convertir_lista(arreglo)
        txtJ=convertir_a_json(a)
        insertar_compra(txtJ,provedores, empleados)
        return redirect(url_for('compras.compraM'))
     return render_template('comprasGuadar.html',form=create_form, provedor=provedor, empleado=empleado,materiaPrima=materiaPrima)

def convertir_lista(cadenas):
    lista_resultado = []
    for cadena in cadenas:
        # Eliminar corchetes y comillas sobrantes
        cadena_limpia = cadena.replace("[", "").replace("]", "").replace("'", "").replace(")", "").replace("(", "")
        campos = cadena_limpia.split(", ")
        # Convertir campos a los tipos de datos correctos
        id_producto = int(campos[1])
        cantidad = float(campos[2]) 
        precio = float(campos[3])
        fecha = campos[4].replace("(", "").replace(")", "")  # Eliminar paréntesis de la fecha
        # Crear lista con los valores convertidos
        lista_producto = [int(round(cantidad)),fecha ,id_producto , round(precio, 2)]
        lista_resultado.append(lista_producto)
    return lista_resultado

def convertir_a_json(lista):
    nueva_lista = []
    for l in lista:
        cantidad = l[0]
        fecha = l[1]
        id_producto = l[2]
        precio = l[3]
        nueva_lista.append([cantidad, fecha, id_producto, precio])
    json_data = json.dumps(nueva_lista)
    return json_data

def guardar_en_arreglo(lista):
    arreglo = []
    for diccionario in lista:
        arreglo.append(diccionario.values())
    return arreglo

def quitar_titulo(json_string):
    # Cargar la cadena JSON como un objeto Python
    data = json.loads(json_string)
    
    # Crear una lista vacía para almacenar los valores
    valores = []
    
    # Iterar sobre los elementos del objeto y extraer los valores
    for elemento in data:
        valores.append(list(elemento.values()))
        
    return valores

def quitar_prefijo(lista):
    nueva_lista = []
    for valor in lista:
        cadena = str(valor)
        nueva_cadena = cadena.replace("dict_values(", "")
        nueva_lista.append(nueva_cadena)
    return nueva_lista

def convertir_a_enteros(lista):
    """
    Convierte los valores de una lista de listas de cadenas a una lista de listas de enteros.
    
    :param lista: La lista de listas de cadenas a convertir.
    :return: La lista de listas de enteros resultante.
    """
    return [[int(valor) for valor in sublista] for sublista in lista]


nombres = []
@compras.route('/comprasGuardar', methods=['GET', 'POST'])
@login_required
def index():
    create_form = compra(request.form)
    provedor = obtener_proveedor()
    empleado = obtener_empleados()
    materiaPrima = obtener_materia_prima()
    
    if request.method == 'POST':
        materia = (request.form.get('materia')).split(",")
        id_materia = materia[0]
        nombre_materia = materia[1]
        cantidadMateria = float(request.form.get('cantidad', 0))
        precio = float(request.form.get('precio', 0))
        fechaCaducidad = request.form.get('fechaCaducidad')

        for item in nombres:
            if item['nombre'] == nombre_materia:
                item['nombre'] += nombre_materia
                item['id_materia'] += id_materia
                item['cantidad'] += cantidadMateria
                item['precio'] += precio
                break
        else:
            nombres.append({'nombre': nombre_materia, 'id_materia': id_materia, 'cantidad': cantidadMateria, 'precio': precio, 'fechaCaducidad': fechaCaducidad})

    create_form = compra()
    return render_template('comprasGuadar.html', nombres=nombres,form=create_form, provedor=provedor, empleado=empleado,materiaPrima=materiaPrima)


@compras.route('/removeC/<int:index>')
@login_required
def removeC(index):
    create_form = compra()
    provedor=obtener_proveedor()
    empleado=obtener_empleados()
    materiaPrima=obtener_materia_prima()
    nombres.pop(index)
    return redirect(url_for('compras.index'))
    # return render_template('comprasGuadar.html', nombres=nombres,form=create_form, provedor=provedor, empleado=empleado,materiaPrima=materiaPrima)


# @empleados.route('/empleados',method=["POST"])
# def registro():
#      nombre = request.form["txtNombre"]
#      apaterno = request.form["txtApellidoPaterno"]
#      email = request.form["txtApellidoMaterno"]
#      nombre = request.form["txtTelefono"]
#      apaterno = request.form["txtApellidoPaterno"]
#      email = request.form["txtCorreo"]
#      nombre = request.form["txtCalle"]
#      apaterno = request.form["txtColonia"]
#      email = request.form["txtNumero"]
#      controller.controlador_alumnos.insertar_alumnos(nombre,apaterno,email)

 













# @students.route('/insert-student', methods=['GET', 'POST'])
# def insert_student():
#     create_form = StudentForm(request.form)
#     if (request.method == 'POST'):
#         insertStudent(create_form)
#         return redirect(url_for('students.index_students'))
#     return render_template('insert_student.html', form=create_form)


# @students.route('/update-student', methods=['GET', 'POST'])
# def update_student():
#     create_form = StudentForm(request.form)
#     if (request.method == 'GET'):
#         id = request.args.get('id')
#         response = setStudent(id, create_form)
#     if (request.method == 'POST'):
#         updateStudent(create_form.id.data, create_form)
#         return redirect(url_for('students.index_students'))
#     return render_template('update_student.html', form=response)


# @students.route('/delete-student', methods=['GET', 'POST'])
# def delete_student():
#     create_form = StudentForm(request.form)
#     if (request.method == 'GET'):
#         id = request.args.get('id')
#         response = setStudent(id, create_form)
#     if (request.method == 'POST'):
#         deleteStudent(create_form.id.data, create_form)
#         return redirect(url_for('students.index_students'))
#     return render_template('delete_student.html', form=response)

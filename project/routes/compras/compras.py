from flask import Blueprint, render_template, request, redirect, url_for
from models.compra.compra_Forms import compra
from controllers.controllerEmpleado import obtener_empleados
from controllers.compra.compra_Controllers import obtener_compras, insertar_compra
from controllers.proveedor.proveedor_Controllers import obtener_proveedor, insertar_provedor
from controllers.materiaPrima.materiaPrima_Controllers import obtener_materia_prima
import json
from flask_security import roles_required, login_required



compras = Blueprint('compras', __name__)

@compras.route('/compras')
@login_required
def compraM():
     emp = obtener_compras()
     print(emp)
     create_form = compra(request.form)
     provedor=obtener_proveedor()
     empleado=obtener_empleados()
     return render_template('compras.html',form=create_form, provedor=provedor, empleado=empleado,compras=emp)



@compras.route('/insertar_compra', methods=['GET', 'POST'])
def compraGuardar():
     if request.method == 'POST':
        create_form = compra(request.form)
        provedor=obtener_proveedor()
        empleado=obtener_empleados()
        materiaPrima=obtener_materia_prima()
        empleados = request.form['empleado']
        provedores = request.form['provedor']
        arr_receta=nombres
        arr=guardar_en_arreglo(arr_receta)
        arreglo=quitar_prefijo(arr)
        print('ESTO SE RECIBE SIN TEXTO')
        a=convertir_a_lista(arreglo)
        print(str(a))
        print(empleados)
        print(provedores)
        insertar_compra(str(a),provedores, empleados)
        return redirect(url_for('compras.compraM'))
     return render_template('comprasGuadar.html',form=create_form, provedor=provedor, empleado=empleado,materiaPrima=materiaPrima)

def convertir_a_lista(lista_de_cadenas):
    lista_resultado = []
    for cadena in lista_de_cadenas:
        # Eliminar los caracteres no deseados de la cadena y convertirla en una lista de valores
        valores = cadena.strip("[']").split("', '")
        
        # Convertir los valores en los tipos de datos correctos y crear una nueva lista
        nueva_lista = [
            int(valores[1]),   # Cantidad
            valores[3],        # Fecha de vencimiento
            int(valores[0]),   # ID del producto
            float(valores[2])  # Precio unitario
        ]
        
        # Agregar la nueva lista a la lista de resultados
        lista_resultado.append(nueva_lista)
        
    return lista_resultado

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
def index():
    create_form = compra(request.form)
    provedor=obtener_proveedor()
    empleado=obtener_empleados()
    materiaPrima=obtener_materia_prima()
    if request.method == 'POST':
        if 'materia' in request.form:
          materia = request.form['materia']
        else:
          materia = None
        if 'cantidad' in request.form:
          cantidadMateria = request.form['cantidad']
        else:
          cantidadMateria = None
        if 'precio' in request.form:
          precio = request.form['precio']
        else:
          precio = None
        if 'fechaCaducidad' in request.form:
          fechaCaducidad = request.form['fechaCaducidad']
        else:
          fechaCaducidad = None
        nombres.append({'nombre': materia, 'cantidad': cantidadMateria, 'precio': precio, 'fechaCaducidad': fechaCaducidad})
        print(nombres)
    else:
         create_form = compra()
    return render_template('comprasGuadar.html', nombres=nombres,form=create_form, provedor=provedor, empleado=empleado,materiaPrima=materiaPrima)


@compras.route('/removeC/<int:index>')
def removeC(index):
    create_form = compra()
    provedor=obtener_proveedor()
    empleado=obtener_empleados()
    materiaPrima=obtener_materia_prima()
    nombres.pop(index)
    return render_template('comprasGuadar.html', nombres=nombres,form=create_form, provedor=provedor, empleado=empleado,materiaPrima=materiaPrima)


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

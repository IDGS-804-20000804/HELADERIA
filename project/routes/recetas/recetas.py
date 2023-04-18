from flask import Blueprint, render_template, request, redirect, url_for
from db.db import get_connection
from flask_wtf.csrf import CSRFProtect
from models.receta.receta_Forms import receta
from controllers.receta.receta_Controllers import obtener_recetas, obtener_receta_por_id, insertar_receta, eliminar_receta_por_id, modificar_receta
from controllers.materiaPrima.materiaPrima_Controllers import obtener_materia_prima
import json

recetas = Blueprint('recetas', __name__ )

# @recetas.route('/recetas', methods=["POST", "GET"])
# def Lreceta():
#      if request.method == 'POST':
#         # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
#         create_form = receta(request.form)
        
      
#      else:
#         create_form = receta()
#         r = obtener_recetas()
#         print(r)
#         mp = obtener_materia_prima()
#         print(mp)
#         foto=create_form.foto.data
#         datosMateria=list()
#         nombre = create_form.cantidad.data
#         datosMateria.append(nombre)
#         return render_template('recetas.html', form=create_form, receta=r, materiaPrima=mp, foto=foto, datosMateria=datosMateria)
lista=[]
@recetas.route("/recetasModificar",methods=['GET','POST'])
def modificar():
    create_fprm=receta(request.form)
    listaM = []  # Inicializar la variable listaM
    if request.method=='GET':
        id=request.args.get('id')
        emp=obtener_receta_por_id(id)
        create_fprm.id_Receta.data=request.args.get('id')
        create_fprm.nombre.data=emp[0][1]
        create_fprm.cantidad.data=emp[0][2]
        create_fprm.foto.data=emp[0][4]
        create_fprm.precio.data=emp[0][3] 
        texto = emp[0][5]
        listaM = eval(texto)
        lista.append(listaM)
        emp = obtener_recetas()
        print(emp)
        print(lista)
    if request.method=='POST':
        id_Receta = request.form['id_Receta']
        nombre = request.form['nombre']
        cantidad= request.form['cantidad']
        precio= request.form['precio']
        foto='uploads/3'
        arr_receta=listaM  # Asignar la lista recuperada a arr_receta
        json_string = json.dumps(arr_receta)
        valores = quitar_titulo(json_string)
        lista_de_listas = list(valores)
        lista_de_listas_enteros = convertir_a_enteros(lista_de_listas)
        print(lista_de_listas_enteros)
        txt = '[{}]'.format(', '.join('[{}]'.format(', '.join(map(str, sublst))) for sublst in lista_de_listas_enteros))
        modificar_receta(id_Receta,nombre,cantidad, precio, foto,txt)
        return redirect(url_for('recetas.indexMain'))
    return render_template('recetasModificar.html', form= create_fprm, receta=emp, lista=listaM)

@recetas.route('/removeM/<int:index>')
def removeM(index):
    create_form = receta()
    mp = obtener_materia_prima()
    r = obtener_recetas()
    lista.pop(index)
    return render_template('recetasGuardar.html', nombres=nombres, form=create_form, receta=r, materiaPrima=mp)




nombres = []

@recetas.route('/recetas', methods=['GET', 'POST'])
def indexMain():
    create_form = receta()
    r = obtener_recetas()
    mp = obtener_materia_prima()
    if request.method == 'POST':
        materia_seleccionada = request.form['materia']
        cantidad = request.form['cantidad']
        nombres.append({'nombre': materia_seleccionada, 'cantidad': cantidad})
    else:
         create_form = receta()
         r = obtener_recetas()
         print(r)
    return render_template('recetas.html', nombres=nombres,form=create_form, receta=r,materiaPrima=mp)

@recetas.route('/recetasGuardar', methods=['GET', 'POST'])
def index():
    create_form = receta()
    r = obtener_recetas()
    mp = obtener_materia_prima()
    if request.method == 'POST':
        materia_seleccionada = request.form['materia']
        cantidadMateria = request.form['cantidadMateria']
        nombres.append({'nombre': materia_seleccionada, 'cantidad': cantidadMateria})
        print(nombres)
    else:
         create_form = receta()
         r = obtener_recetas()
         print(r)
    return render_template('recetasGuardar.html', nombres=nombres,form=create_form, receta=r,materiaPrima=mp)


@recetas.route('/remove/<int:index>')
def remove(index):
    create_form = receta()
    mp = obtener_materia_prima()
    r = obtener_recetas()
    nombres.pop(index)
    return render_template('recetasGuardar.html', nombres=nombres,form=create_form, receta=r,materiaPrima=mp)

@recetas.route('/insertar_receta', methods=["POST"])
def realizar_insercion():
    # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
    create_form = receta()
    r = obtener_recetas()
    nombre = request.form['nombre']
    cantidad= request.form['cantidad']
    precio= request.form['precio']
    ruta_imagen='uploads/3'
    arr_receta=nombres
    json_string = json.dumps(arr_receta)
    valores = quitar_titulo(json_string)
    lista_de_listas = list(valores)
    lista_de_listas_enteros = convertir_a_enteros(lista_de_listas)
    print(nombre+','+cantidad+','+precio+','+ruta_imagen)
    print(lista_de_listas_enteros)
    txt = '[{}]'.format(', '.join('[{}]'.format(', '.join(map(str, sublst))) for sublst in lista_de_listas_enteros))
    # Lógica para insertar empleado en la base de datos
    insertar_receta(nombre,int(cantidad), float(precio), ruta_imagen,txt)
    # De cualquier modo, y si todo fue bien, redireccionar
    return render_template('recetas.html',form=create_form, receta=r)

def quitar_titulo(json_string):
    # Cargar la cadena JSON como un objeto Python
    data = json.loads(json_string)
    
    # Crear una lista vacía para almacenar los valores
    valores = []
    
    # Iterar sobre los elementos del objeto y extraer los valores
    for elemento in data:
        valores.append(list(elemento.values()))
        
    return valores

def convertir_a_enteros(lista):
    """
    Convierte los valores de una lista de listas de cadenas a una lista de listas de enteros.
    
    :param lista: La lista de listas de cadenas a convertir.
    :return: La lista de listas de enteros resultante.
    """
    return [[int(valor) for valor in sublista] for sublista in lista]


@recetas.route('/recetaEliminar', methods=['GET', 'POST'])
def eliminar_receta():
    create_fprm = receta(request.form)
    r = obtener_recetas()
    if request.method == 'GET':
        # id = request.args.get('id')
        create_fprm.id_Receta.data=request.args.get('id')
    if request.method == 'POST':
        id=create_fprm.id_Receta.data
        eliminar_receta_por_id(id)  
        # emp = obtener_empleados() # Comenta esta línea si no la necesitas
        return render_template('recetas.html', form=create_fprm, receta=r)
    return render_template('recetaEliminar.html', form=create_fprm, receta=r)

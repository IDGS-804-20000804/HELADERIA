from flask import Blueprint, render_template, request, redirect, url_for,jsonify
from db.db import get_connection
from flask_wtf.csrf import CSRFProtect
from models.receta.receta_Forms import receta
from controllers.receta.receta_Controllers import obtener_recetas, obtener_receta_por_id, insertar_receta, eliminar_receta_por_id, modificar_receta,stringAleatorio
from controllers.materiaPrima.materiaPrima_Controllers import obtener_materia_prima
import json
from flask_security import roles_required, login_required
#Para subir archivo tipo foto al servidor
import os
from werkzeug.utils import secure_filename 

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
listaArreglo=[]
# @recetas.route("/recetasModificar",methods=['GET','POST'])
# @login_required
# def modificar():
#     create_fprm=receta(request.form)
#     listaM = []  # Inicializar la variable listaM
#     mp = obtener_materia_prima()
#     recetaL=obtener_recetas()
#     if request.method=='GET':
#         # lista.clear()
#         # listaArreglo.clear()
#         # lista.clear()
#         id=request.args.get('id')
#         emp=obtener_receta_por_id(id)
#         create_fprm.id_Receta.data=request.args.get('id')
#         create_fprm.nombre.data=emp[0][1]
#         create_fprm.cantidad.data=emp[0][2]
#         create_fprm.foto.data=emp[0][4]
#         create_fprm.precio.data=emp[0][3] 
#         texto = emp[0][5]
#         listaM = eval(texto)
#         lista.append(listaM)
#         for elemento in lista:
#             listaArreglo.append(elemento)
#         print("Este es el arreglo")
#         print(listaArreglo)
#         listaA=transformar_datos(listaArreglo)
#         for a in listaA:
#             nombres.append(a)
#         print('hOLA')
#         print(listaA)
#     if request.method=='POST':
#         id_Receta = create_fprm.id_Receta.data
#         nombre = create_fprm.nombre.data
#         cantidad= create_fprm.cantidad.data
#         precio= create_fprm.precio.data
#         foto='uploads/3'
#         arr_receta=nombres
#         json_string = json.dumps(arr_receta)
#         valores = quitar_titulo(json_string)
#         lista_de_listas = list(valores)
#         lista_de_listas_enteros = convertir_a_enteros(lista_de_listas)
#         txt = '[{}]'.format(', '.join('[{}]'.format(', '.join(map(str, sublst))) for sublst in lista_de_listas_enteros))
#         modificar_receta(id_Receta,nombre,cantidad, precio, foto,txt)
#         nombres.clear()
#         return redirect(url_for('recetasModificar.indexMain'))
#     return render_template('recetasModificar.html',nombres=nombres, form= create_fprm, receta=recetaL, lista=listaA,materiaPrima=mp)

# def transformar_datos(datos):
#     resultado = []
#     for i, item in enumerate(datos[0]):
#         nombre = str(i+1)
#         cantidad = str(item[0])
#         resultado.append({'nombre': nombre, 'cantidad': cantidad})
#     return resultado

@recetas.route('/recetasModificar', methods=['GET', 'POST'])
@login_required
def indexMainModificar():
    modificar()
    create_form = receta()
    r = obtener_recetas()
    mp = obtener_materia_prima()
    if request.method == 'POST':
        materia_seleccionada = request.form['materia']
        cantidad = create_form.cantidadMateria.data
        lista.append({'nombre': materia_seleccionada, 'cantidad': cantidad})
    else:
        create_form = receta()
        r = obtener_recetas()
    return render_template('recetasModificar.html', nombres=nombres,form=create_form, receta=r,materiaPrima=mp)

@recetas.route('/removeM/<int:index>')
@login_required
def removeM(index):
    create_form = receta()
    mp = obtener_materia_prima()
    r = obtener_recetas()
    listaArreglo.pop(index)
    return render_template('recetasModificar.html', nombres=nombres, form=create_form, receta=r, materiaPrima=mp)


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
    return render_template('recetas.html', nombres=nombres,form=create_form, receta=r,materiaPrima=mp)

nombres = []

@recetas.route('/recetasGuardar', methods=['GET', 'POST'])
@login_required
def index():
    create_form = receta()
    r = obtener_recetas()
    mp = obtener_materia_prima()
    if request.method == 'POST':
        materia = (request.form.get('materia')).split(",")
        id_materia_prima = materia[0]
        materia_seleccionada = materia[1]
        cantidadMateria = request.form['cantidadMateria']
        nombres.append({'nombre': materia_seleccionada, 'id_materia_prima': id_materia_prima, 'cantidad': cantidadMateria})
    else:
        create_form = receta()
        r = obtener_recetas()
    return render_template('recetasGuardar.html', nombres=nombres,form=create_form, receta=r,materiaPrima=mp)


@recetas.route('/remove/<int:index>')
@login_required
def remove(index):
    create_form = receta()
    mp = obtener_materia_prima()
    r = obtener_recetas()
    nombres.pop(index)
    return redirect(url_for('recetas.index'))

@recetas.route('/insertar_receta', methods=["POST"])
@login_required
def realizar_insercion():

    # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
    create_form = receta()
    r = obtener_recetas()
    nombre = request.form['nombre']
    cantidad= request.form['cantidad']
    precio= request.form['precio']
    arr_receta=nombres
    arr_receta_parse = [[int(item['id_materia_prima']), int(item['cantidad'])] for item in arr_receta]
    arr_receta_parse_string = str(arr_receta_parse)
    ruta_imagen='uploads/1'
    insertar_receta(nombre,int(cantidad), float(precio), ruta_imagen, arr_receta_parse_string)
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
@login_required
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



# Para Recibir la foto --------------------------------------------
# def recibeFoto(file):
#     print(file)
#     basepath = os.path.dirname (__file__) #La ruta donde se encuentra el archivo actual
#     filename = secure_filename(file.filename) #Nombre original del archivo

#     #capturando extensión del archivo ejemplo: (.png, .jpg, .pdf ...etc)
#     extension           = os.path.splitext(filename)[1]
#     nuevoNombreFile     = stringAleatorio() + extension
#     #print(nuevoNombreFile)
        
#     upload_path = os.path.join(basepath, 'static', 'fotos', nuevoNombreFile)
#     file.save(upload_path)

#     return nuevoNombreFile
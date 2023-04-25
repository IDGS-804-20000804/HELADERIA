from flask import Blueprint, render_template, request, redirect, url_for,session
from db.db import get_connection
from flask_wtf.csrf import CSRFProtect
from models.receta.receta_Forms import receta
from controllers.receta.receta_Controllers import obtener_recetas, obtener_receta_por_id, insertar_receta, eliminar_receta_por_id, modificar_receta
from controllers.materiaPrima.materiaPrima_Controllers import obtener_materia_prima
import json
from flask_security import roles_required, login_required
import http.cookies as Cookies

 

recetasModificar = Blueprint('recetasModificar', __name__ )
@recetasModificar.route('/recetasModif', methods=['GET', 'POST'])
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


lista=[]
nombres=[]
listaArreglo=[]
listaA=[]

@recetasModificar.route("/recetasModificar",methods=['GET','POST'])
@login_required
def modificar():
    create_fprm=receta(request.form)
    listaM = []  # Inicializar la variable listaM
    mp = obtener_materia_prima()
    recetaL=obtener_recetas()
    if request.method=='GET':
        id=request.args.get('id')
        session['mi_dato'] = id
        emp=obtener_receta_por_id(id)
        create_fprm.id_Receta.data=request.args.get('id')
        create_fprm.nombre.data=emp[0][1]
        create_fprm.cantidad.data=emp[0][2]
        create_fprm.foto.data=emp[0][4]
        create_fprm.precio.data=emp[0][3] 
        texto = emp[0][5]
        print('------------------------------------HOLA -----------------')
        print(texto)
        lista.clear()
        listaArreglo.clear()
        
        listaM = eval(texto)
        lista.append(listaM)
        for elemento in lista:
            listaArreglo.append(elemento)
        listaA=transformar_datos(listaArreglo)
        for a in listaA:
            nombres.append(a)
    if request.method=='POST':
        print('-----------------------HOLA DESDE MODIFICAR------------------')
        redirect(url_for('recetasModificar.modificar'))
        id_Receta = create_fprm.id_Receta.data
        nombre = create_fprm.nombre.data
        cantidad= create_fprm.cantidad.data
        precio= create_fprm.precio.data
        foto='uploads/3'
        arr_receta=nombres
        json_string = json.dumps(arr_receta)
        valores = quitar_titulo(json_string)
        lista_de_listas = list(valores)
        lista_de_listas_parse = [[int(item[0]), int(item[2])] for item in valores]
        lista_de_listas_parse_string = str(lista_de_listas_parse)
        nombres.clear()
        modificar_receta(id_Receta,nombre,cantidad, precio, foto, lista_de_listas_parse_string)
        return redirect(url_for('recetas.indexMain'))
    return render_template('recetasModificar.html',nombres=nombres, form= create_fprm, receta=recetaL, lista=listaA,materiaPrima=mp)



@recetasModificar.route('/recetasAgregar', methods=['GET', 'POST'])
def index():
    create_fprm=receta(request.form)
    mp = obtener_materia_prima()
    if request.method == 'GET':
        id= session.get('mi_dato')
        emp=obtener_receta_por_id(id)
        create_fprm.id_Receta.data=id
        create_fprm.nombre.data=emp[0][1]
        create_fprm.cantidad.data=emp[0][2]
        create_fprm.foto.data=emp[0][4]
        create_fprm.precio.data=emp[0][3] 
    if request.method == 'POST':
        materia = (request.form.get('materia')).split(",")
        print(materia)
        id_materia_prima = materia[0]
        materia_seleccionada = materia[1]
        cantidad_materia = request.form['cantidadMateria']
        nombres = agregar_receta(materia_seleccionada, cantidad_materia, id_materia_prima)
        listaA.clear()
        for a in nombres:
            listaA.append(a)
        id= session.get('mi_dato')
        emp=obtener_receta_por_id(id)
        create_fprm.id_Receta.data=id
        create_fprm.nombre.data=emp[0][1]
        create_fprm.cantidad.data=emp[0][2]
        create_fprm.foto.data=emp[0][4]
        create_fprm.precio.data=emp[0][3] 
    
    r = obtener_recetas()
    return render_template('recetasModificar.html', lista=listaA, form=create_fprm, receta=r, materiaPrima=mp)



@recetasModificar.route('/removeM/<int:index>')
def removeM(index):
    create_fprm=receta(request.form)
    mp = obtener_materia_prima()
    r = obtener_recetas()
    nombres.pop(index)
    listaA.clear()
    for a in nombres:
        listaA.append(a)
    
    return redirect(url_for('recetasModificar.index'))

def transformar_datos(datos):
    resultado = []
    for i, item in enumerate(datos[0]):
        id = str(item[0])
        nombre = str(item[1])
        cantidad = str(item[2])
        resultado.append({'id': id,'nombre': nombre, 'cantidad': cantidad})
    return resultado


def agregar_receta(materia_seleccionada, cantidad_materia, id_materia_prima):
    for ingrediente in nombres:
        if ingrediente['nombre'] == materia_seleccionada and ingrediente['id'] == int(id_materia_prima):
            ingrediente['cantidad'] = str(int(ingrediente['cantidad']) + int(cantidad_materia))
            return nombres
        
    nombres.append({'id': int(id_materia_prima), 'nombre': materia_seleccionada, 'cantidad': cantidad_materia})
    
    # Sumar la cantidad de ingredientes con el mismo ID
    for i in range(len(nombres)):
        if nombres[i]['id'] == int(id_materia_prima) and nombres[i]['nombre'] != materia_seleccionada:
            nombres[i]['cantidad'] = str(int(nombres[i]['cantidad']) + int(cantidad_materia))
            return nombres
    
    return nombres

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
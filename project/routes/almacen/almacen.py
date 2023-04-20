from flask import Blueprint, render_template, request, redirect, url_for
from controllers.almacen.almacen_Controllers import obtener_almacen
from db.db import get_connection 
import datetime


almacen = Blueprint('almacen', __name__)


@almacen.route('/almacen', methods=["POST", "GET"])
def almacenP():
    
    emp = obtener_almacen()
    print(emp)
    emp1=sumar_cantidades(emp)
    return render_template('almacen.html', almacen=emp1)

def sumar_cantidades(tuplas):
    diccionario = {}
    for tupla in tuplas:
        if tupla[1] in diccionario:
            diccionario[tupla[1]] += tupla[2]
        else:
            diccionario[tupla[1]] = tupla[2]

    resultado = []
    for nombre, cantidad in diccionario.items():
        unidad = ''
        for tupla in tuplas:
            if tupla[1] == nombre:
                unidad = tupla[3]
                break
        resultado.append((1, nombre, cantidad, unidad, datetime.datetime.now()))
    return resultado
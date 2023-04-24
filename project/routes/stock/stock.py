from flask import Blueprint, render_template, request, redirect, url_for
from controllers.stock.stock_Controllers import consultar_recetas_posibles, obtener_stock, insertar_stock
from db.db import get_connection 
import datetime
from models.stock.stock_Forms import Stock
import json
import ast

stock = Blueprint('stock', __name__)


@stock.route('/stock', methods=["POST", "GET"])
def stockProducto():
    if request.method == 'GET':
        create_form = Stock()
        emp = consultar_recetas_posibles()
        print(emp)
        receta=quitar_parentesis(emp)
        print(receta)
    return render_template('stock.html',form=create_form,receta=receta)


def quitar_parentesis(tupla):
    lista_str = tupla[0]
    lista = ast.literal_eval(lista_str)
    return lista

@stock.route('/insertar_stock', methods=["POST"])
def realizar_insercion():
    # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
    stock = request.form['stock']
    caducidad = request.form['caducidad']
    precio = request.form['precio']
    fc=caducidad+" 00:00:00"
    print(fc)
    
    # Lógica para insertar empleado en la base de datos
    insertar_stock( fc,precio,stock )
    # De cualquier modo, y si todo fue bien, redireccionar
    return redirect(url_for('ventas.ventas'))
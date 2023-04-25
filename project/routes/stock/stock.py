from flask import Blueprint, render_template, request, redirect, url_for
from controllers.stock.stock_Controllers import consultar_recetas_posibles, obtener_stock, insertar_stock
from db.db import get_connection 
import datetime
from models.stock.stock_Forms import Stock
import json
import ast
from models.login.ModeloLogin import ModeloLogin
from flask_login import login_required, current_user, UserMixin
import ast
stock = Blueprint('stock', __name__)


@stock.route('/stock', methods=["POST", "GET"])
def stockProducto():
    if request.method == 'GET':
        create_form = Stock()
        emp = obtener_stock()
    user_id = current_user.id_usuario
    db = get_connection()
    datos = ModeloLogin.get_by_id(db, user_id)
    list = ast.literal_eval(datos.roles)
    return render_template('stock.html',form=create_form,receta=emp, roles=list)


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
    
    # Lógica para insertar empleado en la base de datos
    insertar_stock( fc,precio,stock )
    # De cualquier modo, y si todo fue bien, redireccionar
    return redirect(url_for('ventas.ventas'))
from flask import Blueprint, render_template, request, redirect, url_for
from db.db import get_connection
from models.venta.venta_Forms import Venta
from controllers.venta.venta_Controllers import obtener_venta, insertar_venta
from flask_security import roles_required, login_required
venta = Blueprint('ventas', __name__)

@venta.route('/ventas', methods=["POST", "GET"])
@login_required
def ventas():
    if request.method == 'POST':
        # total_venta = request.form['total_venta']
        totales = request.form.getlist('totales')
        ids_recetas = request.form.getlist('ids_recetas')
        precios_receta = request.form.getlist('precios_receta')
        result = []
        for i in range(len(totales)):
            result.append((ids_recetas[i], totales[i], precios_receta[i]))
        arr_venta = [[int(x), int(y), float(z)] for x, y, z in result]
        # receta, cantidad, precio
        fk_cliente = 1
        en = insertar_venta(arr_venta, fk_cliente)
    create_form = Venta()
    en = obtener_venta()
    return render_template('venta.html', form=create_form, stock=en)


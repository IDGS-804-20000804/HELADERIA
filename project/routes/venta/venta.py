from flask import Blueprint, render_template, request, redirect, url_for
from flask_wtf.csrf import CSRFProtect
from db.db import get_connection
from models.venta.venta_Forms import Venta
from controllers.venta.venta_Controllers import obtener_venta

from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
venta = Blueprint('ventas', __name__ )

@venta.route('/ventas', methods=["POST", "GET"])
def ventas():
     if request.method == 'POST':
        # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
        create_form = Venta(request.form)
      #   id_unidadMedida= ''
      #   nombre = create_form.nombre.data
      #   unidadMedida = create_form.unidadMedida.data
        # De cualquier modo, y si todo fue bien, redireccionar
     #    return redirect(url_for('materiaPrima.materiaPrima'))
     else:
         create_form = Venta()
         en = obtener_venta()
         return render_template('venta.html', form=create_form, stock=en)
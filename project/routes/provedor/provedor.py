from flask import Blueprint, render_template, request, redirect, url_for
from db.db import get_connection
from models.proveedor.proveedor_Forms import Proveedor
from controllers.proveedor.proveedor_Controllers import obtener_proveedor
from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
provedor = Blueprint('provedor', __name__ )

@provedor.route('/provedor', methods=["POST", "GET"])
def provedores():
     if request.method == 'POST':
        # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
        create_form = Proveedor(request.form)
      #   id_unidadMedida= ''
      #   nombre = create_form.nombre.data
      #   unidadMedida = create_form.unidadMedida.data
        # De cualquier modo, y si todo fue bien, redireccionar
     #    return redirect(url_for('materiaPrima.materiaPrima'))
     else:
        create_form = Proveedor()
        pro = obtener_proveedor()
        print(pro)
        return render_template('provedor.html', form=create_form, proveedor=pro)
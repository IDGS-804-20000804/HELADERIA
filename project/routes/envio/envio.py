from flask import Blueprint, render_template, request, redirect, url_for
from flask_wtf.csrf import CSRFProtect
from db.db import get_connection
from models.envio.envio_Forms import Envio
from controllers.envio.envio_Controllers import obtener_envio
from flask_login import login_required
envio = Blueprint('envio', __name__ )


@envio.route('/envio', methods=["POST", "GET"])

def envios():
     if request.method == 'POST':
        # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
        create_form = Envio(request.form)
      #   id_unidadMedida= ''
      #   nombre = create_form.nombre.data
      #   unidadMedida = create_form.unidadMedida.data
        # De cualquier modo, y si todo fue bien, redireccionar
     #    return redirect(url_for('materiaPrima.materiaPrima'))
     else:
         create_form = Envio()
         en = obtener_envio()
         return render_template('envio.html', form=create_form, envio=en)
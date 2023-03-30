from flask import Blueprint, render_template, request, redirect, url_for
from models.empleados.forms import EmpleadoForm
from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
registroUsuario = Blueprint('registroUsuario', __name__ )


@registroUsuario.route('/registro')
def registro():
     create_form = EmpleadoForm(request.form)
     return render_template('registro.html')


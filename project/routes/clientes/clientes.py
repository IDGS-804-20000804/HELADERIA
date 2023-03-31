from flask import Blueprint, render_template, request, redirect, url_for
from models.empleados.forms import EmpleadoForm
from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
clientes = Blueprint('clientes', __name__)


@clientes.route('/clientes')
def clientes():
     create_form = EmpleadoForm(request.form)
     return render_template('clientes.html')


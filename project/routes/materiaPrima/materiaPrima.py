from flask import Blueprint, render_template, request, redirect, url_for
from models.empleados.forms import EmpleadoForm
from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
materiaPrima = Blueprint('materiaPrima', __name__ )


@materiaPrima.route('/materiaPrima')
def index_students():
     create_form = EmpleadoForm(request.form)
     return render_template('empleados.html')


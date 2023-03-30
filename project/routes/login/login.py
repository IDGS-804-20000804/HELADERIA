from flask import Blueprint, render_template, request, redirect, url_for
from models.empleados.forms import EmpleadoForm
from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
login = Blueprint('login', __name__ )


@login.route('/login')
def login():
     create_form = EmpleadoForm(request.form)
     return render_template('login.html')


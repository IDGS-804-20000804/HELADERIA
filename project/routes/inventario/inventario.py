from flask import Blueprint, render_template, request, redirect, url_for
from models.inventario.forms import inventarioForm
from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
inventario = Blueprint('inventario', __name__ )


@inventario.route('/inventario')
def index_students():
     create_form = inventarioForm(request.form)
     return render_template('inventario.html')


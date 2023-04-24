from flask import Blueprint, render_template, request, redirect, url_for
from models.inventario.forms import inventarioForm
from flask_wtf.csrf import CSRFProtect
from flask_security import roles_required, login_required
# csrf = CSRFProtect()
inventario = Blueprint('inventario', __name__ )


@inventario.route('/inventario')
@login_required
def index_students():
     create_form = inventarioForm(request.form)
     return render_template('inventario.html')


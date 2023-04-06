from flask import Blueprint, render_template, request, redirect, url_for

from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
materiaPrima = Blueprint('materiaPrima', __name__ )

@materiaPrima.route('/materiaPrima')
def MateriasPrimas():
     return render_template('empleados.html')


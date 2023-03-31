from flask import Blueprint, render_template, request, redirect, url_for
from models.empleados.forms import EmpleadoForm
from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
login = Blueprint('login', __name__)
main = Blueprint('main',__name__)

@login.route('/login')
def logins():

    return render_template('login.html')


@main.route('/main')
def mains():
    return render_template('main.html')

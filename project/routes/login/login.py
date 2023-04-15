from flask import Blueprint, render_template, request, redirect, url_for
from flask_wtf.csrf import CSRFProtect

login = Blueprint('login', __name__, url_prefix='/security')
main = Blueprint('main',__name__, url_prefix='/security')

@login.route('/login')
def logins():

    return render_template('/security/login.html')


@main.route('/main')
def mains():
    return render_template('inicio.html')


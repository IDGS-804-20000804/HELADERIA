from flask import Blueprint, render_template, request, redirect, url_for
from models.clientes.clientes import Clientes

clientes = Blueprint('clientes', __name__)


@clientes.route('/clientes')
def cliente():
     form = Clientes(request.form)
     return render_template('clientes.html',form=form)


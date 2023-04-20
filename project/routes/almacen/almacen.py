from flask import Blueprint, render_template, request, redirect, url_for
from controllers.almacen.almacen_Controllers import obtener_almacen
from db.db import get_connection 
from flask_security import roles_required, login_required
almacen = Blueprint('almacen', __name__)


@almacen.route('/almacen', methods=["POST", "GET"])
@login_required
def almacenP():
    emp = obtener_almacen()
    print(emp)
    return render_template('almacen.html', almacen=emp)

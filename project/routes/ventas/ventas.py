from flask import Blueprint, render_template, request, redirect, url_for

from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
ventas = Blueprint('ventas', __name__ )


@ventas.route('/ventas')
def venta():
     
     return render_template('ventas.html')


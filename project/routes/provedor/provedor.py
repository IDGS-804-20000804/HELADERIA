from flask import Blueprint, render_template, request, redirect, url_for

from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
provedor = Blueprint('provedor', __name__ )

@provedor.route('/provedor')
def provedores():
     return render_template('provedor.html')


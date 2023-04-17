from flask import Blueprint, render_template, request, redirect, url_for

from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
registroUsuario = Blueprint('registroUsuario', __name__ , url_prefix='/security')


@registroUsuario.route('/registro')
def registro():
     return render_template('/security/registro.html')


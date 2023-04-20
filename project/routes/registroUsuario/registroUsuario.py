from flask import Blueprint, render_template, request, redirect, url_for

from flask_wtf.csrf import CSRFProtect
from models.login.forms import LoginForm

# csrf = CSRFProtect()
registroUsuario = Blueprint('registroUsuario', __name__ , url_prefix='/security')


@registroUsuario.route('/registro',methods=['GET','POST'])
def registro():
     create_form = LoginForm()
     return render_template('/security/registro.html', form=create_form)


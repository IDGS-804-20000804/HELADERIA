from flask import Blueprint, render_template, request, redirect, url_for, Request, flash, Flask
from flask_wtf.csrf import CSRFProtect
from db.db import get_connection 
from flask_login import LoginManager,login_user,logged_user,login_required

from models.login.ModeloLogin import ModeloLogin
from models.login.forms import LoginForm
from models.entities.User import User 
from flask_security import login_required

login = Blueprint('login', __name__, url_prefix='/security')
# login_manager_app=LoginManager(login)

# @login.route('/login', methods=['GET', 'POST'])
# def logins():
#     if request.method == 'POST':
#         db = get_connection()
#         user = User(0, request.form['correo'], request.form['contrasenia'], 1)
#         logued_user = ModeloLogin.inicio(db, user)
#         if logued_user is not None:
#             if logued_user.contrasenia:
#                         login_user(logued_user)
#                         return redirect(url_for('main.mains'))
#             else:
#                 flash("Contraseña Inválida")
#                 return render_template('/security/login.html')
#         else:
#             flash("Usuario No Encontrado")
#             return render_template('/security/login.html')
#     else:
#         return render_template('/security/login.html')




@login.route('/login',methods=['GET','POST'])
def login_view():
    db = get_connection()
    create_form = LoginForm()
    if request.method == 'POST':
        correo = request.form.get('correo', '')
        contrasenia = request.form.get('contrasenia', '')
        if (correo  == '') or (contrasenia  == ''):
            return render_template('/security/login.html',
                                    form=create_form)
        logued_user = ModeloLogin.inicio(correo, contrasenia)
        if logued_user != None:
            return redirect(url_for('main.mains'))
        else:
            flash("Correo o contraseña no coincide")
            return render_template('/security/login.html',
                                form=create_form)
    return render_template('/security/login.html',
                                    form=create_form)

@main.route('/main',methods=['GET','POST'])
@login_required
def mains():
    return render_template('inicio.html')
from flask import Blueprint, render_template, request, redirect, url_for,Request,flash
from flask_wtf.csrf import CSRFProtect
from db.db import get_connection 

from models.logi.ModeloLogin import ModeloLogin
from models.entities.User import User 

login = Blueprint('login', __name__, url_prefix='/security')
main = Blueprint('main',__name__)



@login.route('/login',methods=['GET','POST'])
def logins():
    db = get_connection() 
    if request.method == 'POST':
        # print(request.form['email'])
        # print(request.form['password'])
        user = User(0,request.form['correo'],request.form['contrasenia'],1)
        logued_user = ModeloLogin.inicio(db,user)
        if logued_user != None:
            if logued_user.contrasenia:
                return redirect(url_for('main.mains'))
            else:
                flash("Contraseña Ivalida")
                return render_template('/security/login.html')
        else:
            flash("Usuario No Encontrado")
            return render_template('/security/login.html')
    else:
        return render_template('/security/login.html')


@main.route('/main')
def mains():
    return render_template('inicio.html')

